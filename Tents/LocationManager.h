//
//  IBeaconManager.h
//  FindTent
//
//  Created by 川島 大地 on 2014/07/17.
//  Copyright (c) 2014年 Yukai Engineering. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@protocol LocationManagerDelegate <NSObject>

- (void) updateLocationInfomation;
- (void) updateHeadingInformation;

@end

@interface LocationManager: NSObject<CLLocationManagerDelegate>{
}

@property (nonatomic,strong) CLLocationManager *locationManager;
@property (nonatomic,retain) NSMutableData *receivedData;
@property (nonatomic,strong) NSString *labelStr;

@property (nonatomic) double lon;
@property (nonatomic) double lat;
@property (nonatomic) CLLocationCoordinate2D headCoordinate;
@property (nonatomic) CLLocationDirection headDirection;

@property (nonatomic,strong) id<LocationManagerDelegate> delegate;


+ (LocationManager *)sharedManager;
- (void)startLocationSearvice;
- (void)startHeadingSearvice;
- (void)configureTentLocation;


@end