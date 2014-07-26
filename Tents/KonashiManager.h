//
//  KonashiManager.h
//  FindTent
//
//  Created by 川島 大地 on 2014/07/21.
//  Copyright (c) 2014年 Yukai Engineering. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol KonashiManagerDelegate <NSObject>

- (void) konashiConnected;
- (void) konashiNotConnected;

@end
@interface KonashiManager : NSObject

+ (KonashiManager *)sharedManager;
- (void)startKonashi;
//- (void)sendLightningCommand;
- (void)sendLightningCommand:(unsigned char)c;

-(void)stopFindKonashi;
-(void)startFindKonashi;

@property (nonatomic,strong) id<KonashiManagerDelegate> delegate;

@end