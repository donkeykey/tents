//
//  EmergencyColorSelectionViewController.m
//  Tents
//
//  Created by 川島 大地 on 2014/07/26.
//  Copyright (c) 2014年 川島 大地. All rights reserved.
//

#import "EmergencyColorSelectionViewController.h"
#import "KonashiManager.h"

@interface EmergencyColorSelectionViewController ()

@end

@implementation EmergencyColorSelectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"emergency");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onTouchColorBtn:(id)sender {
    int tag = (int)[sender tag];
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setInteger:tag forKey:@"emerColor"];
    //[self sendLightingCommand];
}
- (IBAction)onTouchPatternBtn:(id)sender {
    int tag = (int)[sender tag];
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setInteger:tag forKey:@"emerPattern"];
    //[self sendLightingCommand];
}
/*
- (void)sendLightingCommand{
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
    */
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
