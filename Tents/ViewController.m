//
//  ViewController.m
//  Tents
//
//  Created by 川島 大地 on 2014/07/25.
//  Copyright (c) 2014年 川島 大地. All rights reserved.
//

#import "ViewController.h"
#import "FunctionManager.h"

@interface ViewController ()
- (IBAction)cameraButton:(id)sender;
- (IBAction)lightButton:(id)sender;
@property FunctionManager* functionManager;
@property BOOL isLightON;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"hoge");
    self.navigationController.navigationBarHidden = YES;
    _functionManager = [[FunctionManager alloc]init];
    _isLightON = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cameraButton:(id)sender {
    [_functionManager startCamera:self];
    
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
