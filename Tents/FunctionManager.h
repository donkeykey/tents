//
//  FunctionManager.h
//  Tents
//
//  Created by yasuo on 2014/07/26.
//  Copyright (c) 2014年 川島 大地. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "ViewController.h"

@interface FunctionManager : NSObject <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

-(void)startHome;
-(void)stopHome;
-(void)startCamera : (ViewController*) viewController;
-(void)stopCamera;
-(void)startLight;
-(void)stopLight;
-(void)startEdit;
-(void)stopEdit;
-(void)startFlashLight;
-(void)stopFlashLight;
-(void)getWeather: (NSString*)lat :(NSString*)lon;
@end
