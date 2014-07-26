//
//  ColorSelectionViewController.m
//  Tents
//
//  Created by 川島 大地 on 2014/07/26.
//  Copyright (c) 2014年 川島 大地. All rights reserved.
//

#import "UsualColorSelectionViewController.h"
#import "KonashiManager.h"

@interface UsualColorSelectionViewController ()
@property (weak, nonatomic) IBOutlet UIButton *redBtn;
@property (weak, nonatomic) IBOutlet UIButton *greenBtn;
@property (weak, nonatomic) IBOutlet UIButton *blueBtn;
@property (weak, nonatomic) IBOutlet UIButton *yellowBtn;
@property (weak, nonatomic) IBOutlet UIButton *pinkBtn;
@property (weak, nonatomic) IBOutlet UIButton *skyBtn;

@property (weak, nonatomic) IBOutlet UIButton *solidBtn;
@property (weak, nonatomic) IBOutlet UIButton *flushBtn;
@property (weak, nonatomic) IBOutlet UIButton *fadeBtn;
@property (weak, nonatomic) IBOutlet UIButton *rotationBtn;

@end

@implementation UsualColorSelectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"usual");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTouchColorBtn:(id)sender {
    int tag = (int)[sender tag];
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setInteger:tag forKey:@"usualColor"];
    [self sendLightingCommand];
}

- (IBAction)onTouchPatternBtn:(id)sender {
    int tag = (int)[sender tag];
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setInteger:tag forKey:@"usualPattern"];
    [self sendLightingCommand];
}

- (void)sendLightingCommand{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    int color = (int)[ud integerForKey:@"usualColor"];
    int pattern = (int)[ud integerForKey:@"usualPattern"];
    if (pattern == 0) {//Solid
        switch (color) {
            case 0:
                [[KonashiManager sharedManager] sendLightningCommand:'A'];
                break;
            case 1:
                [[KonashiManager sharedManager] sendLightningCommand:'B'];
                break;
            case 2:
                [[KonashiManager sharedManager] sendLightningCommand:'C'];
                break;
            case 3:
                [[KonashiManager sharedManager] sendLightningCommand:'D'];
                break;
            case 4:
                [[KonashiManager sharedManager] sendLightningCommand:'E'];
                break;
            case 5:
                [[KonashiManager sharedManager] sendLightningCommand:'F'];
                break;
            case 6:
                [[KonashiManager sharedManager] sendLightningCommand:'G'];
                break;
            default:
                [[KonashiManager sharedManager] sendLightningCommand:'A'];
                break;
        }
    }else if(pattern == 1){//Flush
        switch (color) {
            case 0:
                [[KonashiManager sharedManager] sendLightningCommand:'H'];
                break;
            case 1:
                [[KonashiManager sharedManager] sendLightningCommand:'I'];
                break;
            case 2:
                [[KonashiManager sharedManager] sendLightningCommand:'J'];
                break;
            case 3:
                [[KonashiManager sharedManager] sendLightningCommand:'K'];
                break;
            case 4:
                [[KonashiManager sharedManager] sendLightningCommand:'L'];
                break;
            case 5:
                [[KonashiManager sharedManager] sendLightningCommand:'M'];
                break;
            case 6:
                [[KonashiManager sharedManager] sendLightningCommand:'N'];
                break;
            default:
                [[KonashiManager sharedManager] sendLightningCommand:'H'];
                break;
        }
    }else if(pattern == 2){//Fade
         switch (color) {
            case 0:
                [[KonashiManager sharedManager] sendLightningCommand:'O'];
                break;
            case 1:
                [[KonashiManager sharedManager] sendLightningCommand:'P'];
                break;
            case 2:
                [[KonashiManager sharedManager] sendLightningCommand:'Q'];
                break;
            case 3:
                [[KonashiManager sharedManager] sendLightningCommand:'R'];
                break;
            case 4:
                [[KonashiManager sharedManager] sendLightningCommand:'S'];
                break;
            case 5:
                [[KonashiManager sharedManager] sendLightningCommand:'T'];
                break;
            case 6:
                [[KonashiManager sharedManager] sendLightningCommand:'U'];
                break;
            default:
                [[KonashiManager sharedManager] sendLightningCommand:'O'];
                break;
         }
     }else if(pattern == 3){//rotation
          switch (color) {
            case 0:
                [[KonashiManager sharedManager] sendLightningCommand:'W'];
                break;
            case 1:
                [[KonashiManager sharedManager] sendLightningCommand:'X'];
                break;
            case 2:
                [[KonashiManager sharedManager] sendLightningCommand:'Y'];
                break;
            case 3:
                [[KonashiManager sharedManager] sendLightningCommand:'Z'];
                break;
            case 4:
                [[KonashiManager sharedManager] sendLightningCommand:'!'];
                break;
            case 5:
                [[KonashiManager sharedManager] sendLightningCommand:'#'];
                break;
            case 6:
                [[KonashiManager sharedManager] sendLightningCommand:'$'];
                break;
            default:
                break;      
         }
     }else{
         switch (color) {
            case 0:
                [[KonashiManager sharedManager] sendLightningCommand:'A'];
                break;
            case 1:
                [[KonashiManager sharedManager] sendLightningCommand:'B'];
                break;
            case 2:
                [[KonashiManager sharedManager] sendLightningCommand:'C'];
                break;
            case 3:
                [[KonashiManager sharedManager] sendLightningCommand:'D'];
                break;
            case 4:
                [[KonashiManager sharedManager] sendLightningCommand:'E'];
                break;
            case 5:
                [[KonashiManager sharedManager] sendLightningCommand:'F'];
                break;
            case 6:
                [[KonashiManager sharedManager] sendLightningCommand:'G'];
                break;
            default:
                [[KonashiManager sharedManager] sendLightningCommand:'A'];
                break;
         }
     }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
