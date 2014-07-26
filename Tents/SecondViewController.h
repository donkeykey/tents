//
//  SecondViewController.h
//  Tents
//
//  Created by 川島 大地 on 2014/07/25.
//  Copyright (c) 2014年 川島 大地. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KonashiManager.h"
#import "LocationManager.h"

@interface SecondViewController : UIViewController<KonashiManagerDelegate,LocationManagerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *lightingTentBtn;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *meterLabel;

@end
