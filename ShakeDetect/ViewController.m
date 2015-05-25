//
//  ViewController.m
//  ShakeDetect
//
//  Created by Bianca Binstock on 2015-05-22.
//  Copyright (c) 2015 Bianca Binstock. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (BOOL)canBecomeFirstResponder
{
    return YES;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.labelOne = [[UILabel alloc]initWithFrame:CGRectMake(50, 30, 200, 44)];
    self.labelOne.text = @"Hello, from Bitnaker Labls";
    [self.view addSubview:_labelOne];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

//-(IBAction)showAlert
//{
//    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Hello World" message:@"This is my first app!" delegate:nil cancelButtonTitle:@"Awesome" otherButtonTitles:nil];
//    
//    [alertView show];
//}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake)
    {
    _labelOne.text = @"Updated Text";;
    }
}

//- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
//{
//}
//
//- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
//{
//    if (motion == UIEventSubtypeMotionShake )
//    {
//        // User was shaking the device. Post a notification named "shake".
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"shake" object:self];
//    }
//}
//
//- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event
//{
//}
//
//- (void)shakeSuccess
//{
//    // do something...
//}
@end
