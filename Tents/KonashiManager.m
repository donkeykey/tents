//
//  KonashiManager.m
//  FindTent
//
//  Created by 川島 大地 on 2014/07/21.
//  Copyright (c) 2014年 Yukai Engineering. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KonashiManager.h"
#import "Konashi.h"
#import "LocationManager.h"

static KonashiManager *manager = nil;

@interface KonashiManager();
@property (nonatomic,strong) NSTimer *tm;

@end

@implementation KonashiManager

@synthesize delegate;

+ (KonashiManager *)sharedManager{
    if (manager == nil) {
        manager = [[self alloc] init];
    }
    return manager;
}

-(void)startKonashi{
    [Konashi initialize];
    [Konashi addObserver:self selector:@selector(ready) name:KONASHI_EVENT_READY];
    //[Konashi addObserver:self selector:@selector(getRSSI) name:KONASHI_EVENT_UPDATE_SIGNAL_STRENGTH];
    
    [self startTimer];
}

#pragma mark - Konashi
- (void)findKonashi:(NSTimer *)timer{
    if ([Konashi isConnected]) {
        NSLog(@"connected konashi");
        [self ready];
        if (self.delegate) {
            [self.delegate konashiConnected];
        }
        [Konashi signalStrengthReadRequest];
        [self getRSSI];
    }else{
        NSLog(@"NOT connected konashi");
        [Konashi findWithName:@"konashi#4-0051"];
        [self.delegate konashiNotConnected];
    }
}

-(void)stopFindKonashi{
    [_tm invalidate];
}

-(void)startFindKonashi{
    [self startTimer];
}

- (void)sendLightningCommand:(unsigned char)c{
    [Konashi uartWrite:c];
}


- (void)ready{
    NSLog(@"%s",__func__);
    [Konashi uartBaudrate:KONASHI_UART_RATE_9K6];
    [Konashi uartMode:KONASHI_UART_ENABLE];
    
    // Drive LED
    [Konashi pwmMode:LED2 mode:KONASHI_PWM_ENABLE_LED_MODE];
    
    //Blink LED (interval: 0.5s)
    [Konashi pwmPeriod:LED2 period:1000000];   // 1.0s
    [Konashi pwmDuty:LED2 duty:500000];       // 0.5s
    [Konashi pwmMode:LED2 mode:ENABLE];
}

- (void)getRSSI{
    int RSSI = [Konashi signalStrengthRead];
    NSLog(@"READ_STRENGTH: %d", RSSI);
    if (RSSI > -55) {
        [[LocationManager sharedManager] configureTentLocation];
    }
}

#pragma mark - private method
- (void) startTimer{
  _tm =
    [NSTimer scheduledTimerWithTimeInterval:1.5f
                                     target:self
                                   selector:@selector(findKonashi:)
                                   userInfo:nil
                                    repeats:YES];
    [_tm fire];   
}

@end