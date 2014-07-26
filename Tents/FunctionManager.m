//
//  FunctionManager.m
//  Tents
//
//  Created by yasuo on 2014/07/26.
//  Copyright (c) 2014年 川島 大地. All rights reserved.
//

#import "FunctionManager.h"

@implementation FunctionManager
{
    ViewController *viewCon;
}

-(void)startHome
{
    
}

-(void)stopHome
{
    
}

-(void)startCamera : (ViewController*) viewController
{
    
    viewController = viewCon;
    
    // カメラの利用
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    
    // カメラが利用可能かチェック
    if ([UIImagePickerController isSourceTypeAvailable:sourceType]) {
        
        // インスタンスの作成
        UIImagePickerController *cameraPicker = [[UIImagePickerController alloc] init];
        cameraPicker.sourceType = sourceType;
        cameraPicker.delegate = self;
        [viewController presentViewController:cameraPicker animated:YES completion:nil];
        
    } else {
        
        NSLog(@"カメラ起動失敗");
        
    }
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{

    UIImage *cameraImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    if (cameraImage != nil) {
        
        UIImageWriteToSavedPhotosAlbum(cameraImage, self, @selector(targetImage:didFinishSavingWithError:contextInfo:), nil);
        
    }
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    NSLog(@"画像保存する");
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{

    [viewCon dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)targetImage:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)context
{

    if (error) {

        // 保存失敗時の処理
        NSLog(@"画像保存失敗");
        
    } else {
        
        // 保存成功時の処理
        NSLog(@"画像保存成功");
        
    }

}

-(void)stopCamera
{
    
}

-(void)startLight
{
    
    AVCaptureDevice *captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    [captureDevice lockForConfiguration:NULL];
    
    captureDevice.torchMode = AVCaptureTorchModeOn;
    
    [captureDevice unlockForConfiguration];
    
}

-(void)stopLight
{
    
    AVCaptureDevice *captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];

    [captureDevice lockForConfiguration:NULL];
    
    captureDevice.torchMode = AVCaptureTorchModeOff;
    
    [captureDevice unlockForConfiguration];
    
}

-(void)startEdit
{
    
}

-(void)stopEdit
{
    
}

-(void)startFlashLight
{
    
}

-(void)stopFlashLight
{
    
}

- (void)getWeather: (NSString*)lat :(NSString*) lon
{
    
    lat = @"31.4989701";
    lon = @"131.2764318";
    
    NSString *url_str = [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/weather?lat=%@&lon=%@", lat, lon];
    NSURL *url = [NSURL URLWithString:url_str];

    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSData *json_data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:json_data options:NSJSONReadingAllowFragments error:nil];
    
    NSLog(@"JSON DATA: %@",jsonObject[@"weather"][0][@"main"]);
    
}

@end