//
//  SecondViewController.m
//  Tents
//
//  Created by 川島 大地 on 2014/07/25.
//  Copyright (c) 2014年 川島 大地. All rights reserved.
//

#import "SecondViewController.h"
#import "LocationManager.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *compassView;


@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[KonashiManager sharedManager] setDelegate:self];
    [[LocationManager sharedManager] setDelegate:self];
    //self.locManager.delegate = self;
    self.navigationController.navigationBarHidden = YES;
    NSLog(@"second view");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - LocationManagerDelegate
- (void)updateLocationInfomation{
    NSLog(@"lon,lat %lf , %lf",[LocationManager sharedManager].lon,[LocationManager sharedManager].lat);
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    CLLocation *newLocation = [[CLLocation alloc]initWithLatitude:[LocationManager sharedManager].lat longitude:[LocationManager sharedManager].lon];
    CLLocation *destinationLocation = [[CLLocation alloc]initWithLatitude:[ud doubleForKey:@"destinationLatitude"] longitude:[ud doubleForKey:@"destinationLongitude"]];
    CLLocationDistance tmpDistance = [destinationLocation distanceFromLocation:newLocation];
    if (tmpDistance > 1000) {
        NSLog(@"%3.0lfkm",tmpDistance/1000);
        _distanceLabel.text =[NSString stringWithFormat:@"%3.0lf",tmpDistance/1000];
        _meterLabel.text = @"km";
    }else{
        NSLog(@"%3.0lfm",tmpDistance);
        _distanceLabel.text = [NSString stringWithFormat:@"%3.0lf",tmpDistance];
        _meterLabel.text = @"m";
    }
}

- (void) updateHeadingInformation{
    NSLog(@"update heading");
    CLLocationCoordinate2D tmpCoordinate = [LocationManager sharedManager].headCoordinate;
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    CLLocation *destinationLocation = [[CLLocation alloc]initWithLatitude:[ud doubleForKey:@"startLatitude"] longitude:[ud doubleForKey:@"startLongtitude"]];

    
    CLLocationDirection tmpDirection =[self CalculateAngle:tmpCoordinate.latitude :tmpCoordinate.longitude :destinationLocation.coordinate.latitude :destinationLocation.coordinate.longitude ];
    //アニメーションでコンパスを回転する
    //[UIView beginAnimations:nil context:nil];
    //[UIView setAnimationDuration:0.2f];
    CLLocationDirection currentDir = [[LocationManager sharedManager] headDirection];
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DRotate(transform, -(M_PI*currentDir/180-tmpDirection), 0, 0, 1);
    _compassView.layer.transform = transform;
    //[UIView commitAnimations];
    //[NSThread sleepForTimeInterval:0.1f];
    [UIView commitAnimations];
    //[NSThread sleepForTimeInterval:0.05f];
}

-(float) CalculateAngle:(float) nLat1 :(float) nLon1 :(float) nLat2 :(float) nLon2
{
    float longitudinalDifference = nLon2 - nLon1;
    float latitudinalDifference  = nLat2 - nLat1;
    float azimuth = (M_PI * .5f) - atan(latitudinalDifference / longitudinalDifference);
    if (longitudinalDifference > 0)   return( azimuth );
    else if (longitudinalDifference < 0) return( azimuth + M_PI );
    else if (latitudinalDifference < 0)  return( M_PI );
    return( 0.0f );
}

#pragma mark - ボタンタッチイベント
- (IBAction)onTouchBackBtn:(id)sender {
    [[LocationManager sharedManager] setDelegate:nil];
    [[KonashiManager sharedManager] setDelegate:nil];
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)onTouchLightingTentBtn:(id)sender {
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    int color = (int)[ud integerForKey:@"emerColor"];
    int pattern = (int)[ud integerForKey:@"emerPattern"];
    if (pattern == 0) {//Solid
        switch (color) {
            case 0:
                [[KonashiManager sharedManager] sendLightningCommand:'a'];
                break;
            case 1:
                [[KonashiManager sharedManager] sendLightningCommand:'b'];
                break;
            case 2:
                [[KonashiManager sharedManager] sendLightningCommand:'c'];
                break;
            case 3:
                [[KonashiManager sharedManager] sendLightningCommand:'d'];
                break;
            case 4:
                [[KonashiManager sharedManager] sendLightningCommand:'e'];
                break;
            case 5:
                [[KonashiManager sharedManager] sendLightningCommand:'f'];
                break;
            case 6:
                [[KonashiManager sharedManager] sendLightningCommand:'g'];
                break;
            default:
                [[KonashiManager sharedManager] sendLightningCommand:'a'];
                break;
        }
    }else if(pattern == 1){//Flush
        switch (color) {
            case 0:
                [[KonashiManager sharedManager] sendLightningCommand:'h'];
                break;
            case 1:
                [[KonashiManager sharedManager] sendLightningCommand:'i'];
                break;
            case 2:
                [[KonashiManager sharedManager] sendLightningCommand:'j'];
                break;
            case 3:
                [[KonashiManager sharedManager] sendLightningCommand:'k'];
                break;
            case 4:
                [[KonashiManager sharedManager] sendLightningCommand:'l'];
                break;
            case 5:
                [[KonashiManager sharedManager] sendLightningCommand:'m'];
                break;
            case 6:
                [[KonashiManager sharedManager] sendLightningCommand:'n'];
                break;
            default:
                [[KonashiManager sharedManager] sendLightningCommand:'h'];
                break;
        }
    }else if(pattern == 2){//Fade
        switch (color) {
            case 0:
                [[KonashiManager sharedManager] sendLightningCommand:'o'];
                break;
            case 1:
                [[KonashiManager sharedManager] sendLightningCommand:'p'];
                break;
            case 2:
                [[KonashiManager sharedManager] sendLightningCommand:'q'];
                break;
            case 3:
                [[KonashiManager sharedManager] sendLightningCommand:'r'];
                break;
            case 4:
                [[KonashiManager sharedManager] sendLightningCommand:'s'];
                break;
            case 5:
                [[KonashiManager sharedManager] sendLightningCommand:'t'];
                break;
            case 6:
                [[KonashiManager sharedManager] sendLightningCommand:'u'];
                break;
            default:
                [[KonashiManager sharedManager] sendLightningCommand:'o'];
                break;
        }
    }else if(pattern == 3){//rotation
        switch (color) {
            case 0:
                [[KonashiManager sharedManager] sendLightningCommand:'w'];
                break;
            case 1:
                [[KonashiManager sharedManager] sendLightningCommand:'x'];
                break;
            case 2:
                [[KonashiManager sharedManager] sendLightningCommand:'y'];
                break;
            case 3:
                [[KonashiManager sharedManager] sendLightningCommand:'z'];
                break;
            case 4:
                [[KonashiManager sharedManager] sendLightningCommand:'%'];
                break;
            case 5:
                [[KonashiManager sharedManager] sendLightningCommand:'&'];
                break;
            case 6:
                [[KonashiManager sharedManager] sendLightningCommand:'@'];
                break;
            default:
                break;
        }
    }else{
        switch (color) {
            case 0:
                [[KonashiManager sharedManager] sendLightningCommand:'a'];
                break;
            case 1:
                [[KonashiManager sharedManager] sendLightningCommand:'b'];
                break;
            case 2:
                [[KonashiManager sharedManager] sendLightningCommand:'c'];
                break;
            case 3:
                [[KonashiManager sharedManager] sendLightningCommand:'d'];
                break;
            case 4:
                [[KonashiManager sharedManager] sendLightningCommand:'e'];
                break;
            case 5:
                [[KonashiManager sharedManager] sendLightningCommand:'f'];
                break;
            case 6:
                [[KonashiManager sharedManager] sendLightningCommand:'g'];
                break;
            default:
                [[KonashiManager sharedManager] sendLightningCommand:'a'];
                break;
        }
    }
}

#pragma mark - konashi delegate
- (void)konashiConnected{
    self.lightingTentBtn.enabled = YES;
}

- (void)konashiNotConnected{
    self.lightingTentBtn.enabled = NO;
}


@end
