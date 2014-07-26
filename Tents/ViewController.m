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

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    if (touch.view.tag == 5) {
        
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    if (touch.view.tag == 5) {
        
    }
}
@end
