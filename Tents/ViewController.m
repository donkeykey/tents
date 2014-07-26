//
//  ViewController.m
//  Tents
//
//  Created by 川島 大地 on 2014/07/25.
//  Copyright (c) 2014年 川島 大地. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "FunctionManager.h"

@interface ViewController ()
- (IBAction)cameraButton:(id)sender;
- (IBAction)lightButton:(id)sender;
@property FunctionManager* functionManager;
@property BOOL isLightON;
@property (nonatomic) CGPoint tentButtonPosition;
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
    NSLog(@"touch began");
    UITouch *touch = [touches anyObject];
    
    if (touch.view.tag == 5) {
        _tentButtonPosition = [self.view viewWithTag:5].frame.origin;
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    NSLog(@"touch move tag=%d",(int)touch.view.tag);
    if (touch.view.tag == 5) {
        UIView *button = [self.view viewWithTag:5];
        CGPoint pt = [touch locationInView:self.view];
        NSLog(@"差:%f",pt.x);
        if (_tentButtonPosition.x >= 40 && _tentButtonPosition.x <= 229 && pt.x -40 >=0 && 229-pt.x >0) {
            [UIView animateWithDuration:0.1f animations:^{
                [button setFrame:CGRectMake(pt.x,button.frame.origin.y, button.frame.size.width, button.frame.size.height)];
                
            }completion:^(BOOL finished){
                
            }];
            
        }
        if (pt.x > 220) {
            SecondViewController *svc = [self.storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
            [self.navigationController pushViewController:svc animated:YES];
        }
    }
}

-(void)viewDidDisappear:(BOOL)animated
{
    UIView *button = [self.view viewWithTag:5];
    [button setFrame:CGRectMake(40,button.frame.origin.y, button.frame.size.width, button.frame.size.height)];
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}
@end
