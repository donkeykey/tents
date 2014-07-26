//
//  SecondViewController.m
//  Tents
//
//  Created by 川島 大地 on 2014/07/25.
//  Copyright (c) 2014年 川島 大地. All rights reserved.
//

#import "SecondViewController.h"
#import "LocationManager.h"
#import "FunctionManager.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *compassView;
- (IBAction)cameraButton:(id)sender;
- (IBAction)lightButton:(id)sender;
@property FunctionManager* functionManager;
@property BOOL isLightON;

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
    _functionManager = [[FunctionManager alloc]init];
    _isLightON = NO;
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    //東京駅をデフォルトにする
//    [ud setDouble:35.681382 forKey:@"destinationLatitude"];
//    [ud setDouble:139.766084 forKey:@"destinationLongitude"];
    //六本木一丁目
    [ud setDouble:35.665595 forKey:@"destinationLatitude"];
    [ud setDouble:139.739 forKey:@"destinationLongitude"];
    //青山一丁目
//    [ud setDouble:35.672765 forKey:@"destinationLatitude"];
//    [ud setDouble:139.724159 forKey:@"destinationLongitude"];
    //六本木
//    [ud setDouble:35.662836 forKey:@"destinationLatitude"];
//    [ud setDouble:139.731443 forKey:@"destinationLongitude"];
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
    double tmp1 = newLocation.coordinate.latitude;
    double tmp2 = newLocation.coordinate.longitude;
    double tmp3 = destinationLocation.coordinate.latitude;
    double tmp4 = destinationLocation.coordinate.longitude;
    NSLog(@"(%lf,%lf)->(%lf,%lf)",tmp1,tmp2,tmp3,tmp4);
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
    LocationManager *lm = [LocationManager sharedManager];
    CLLocationCoordinate2D tmpCoordinate = CLLocationCoordinate2DMake(lm.lat ,lm.lon);
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    CLLocation *destinationLocation = [[CLLocation alloc]initWithLatitude:[ud doubleForKey:@"destinationLatitude"] longitude:[ud doubleForKey:@"destinationLongitude"]];

    
    CLLocationDirection tmpDirection =[self CalculateAngle:tmpCoordinate.latitude :tmpCoordinate.longitude :destinationLocation.coordinate.latitude :destinationLocation.coordinate.longitude ];
    //アニメーションでコンパスを回転する
    CLLocationDirection currentDir = [[LocationManager sharedManager] headDirection];
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DRotate(transform, M_PI-(M_PI*currentDir/180-tmpDirection), 0, 0, 1);
    _compassView.layer.transform = transform;
    NSLog(@"あわせると%@",[self destinationDirection:M_PI-(M_PI*currentDir/180-tmpDirection)]);
    NSLog(@"デバイスの向き%@",[self destinationDirection:M_PI*currentDir/180]);
    NSLog(@"目的地の方向%@",[self destinationDirection:tmpDirection]);
    //ついでに距離も更新する
    [self updateLocationInfomation];
}
- (NSString*)destinationDirection:(double)direction
{
    double tmp = direction*180/M_PI;
    if (tmp < 0) {
        tmp+=360;
    }else if(tmp > 360){
        tmp-=360;
    }
    if (tmp >= 345 || tmp <= 15 ) {
        return @"北";
    }else if (tmp >= 30 && tmp <= 60){
        return @"北東";
    }else if (tmp >= 75 && tmp <= 105){
        return @"東";
    }else if (tmp >= 120 && tmp <= 150){
        return @"南東";
    }else if (tmp >= 165 && tmp <= 195){
        return @"南";
    }else if (tmp >= 210 && tmp <= 240){
        return @"南西";
    }else if (tmp >= 255 && tmp <= 285){
        return @"西";
    }else if (tmp >= 300 && tmp <= 330){
        return @"北西";
    }
    return @"";
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


- (IBAction)cameraButton:(id)sender {
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    
    // カメラが利用可能かチェック
    if ([UIImagePickerController isSourceTypeAvailable:sourceType]) {
        
        // インスタンスの作成
        UIImagePickerController *cameraPicker = [[UIImagePickerController alloc] init];
        cameraPicker.sourceType = sourceType;
        [self presentViewController:cameraPicker animated:YES completion:nil];
    }
}

- (IBAction)lightButton:(id)sender {
    if (_isLightON) {
        [_functionManager stopLight];
        _isLightON = NO;
    } else {
        [_functionManager startLight];
        _isLightON = YES;
    }
    
}
@end
