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

//{

//    NSString *Path;
//    NSDictionary *dict;
//    NSMutableArray *plistArray;
//    int randomValue;
//}

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
    
//    background color
    self.view.backgroundColor = [UIColor yellowColor];
    

}

//do i create a function from this and put in motionEnded?
-(NSArray*) randomColour {
    const NSInteger numberOfColour = 100;
    
    //
    
    NSMutableArray *tempArray = [NSMutableArray arrayWithCapacity:numberOfColour];
    //    wtf is this????
    for (NSInteger i = 0; i < numberOfColour; i ++) {
        CGFloat redValue = (arc4random() % 255) / 255.0f;
        CGFloat blueValue = (arc4random() % 255) / 255.0f;
        CGFloat greenValue = (arc4random() % 255) / 255.0f;
        [tempArray addObject:[UIColor colorWithRed:redValue green:greenValue blue:blueValue alpha:1.0f]];
    }
    return _colourArray = [NSArray arrayWithArray:tempArray];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"words" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSMutableArray *plistArray = dict[@"words"];
    int randomValue = arc4random() % plistArray.count;
    if (motion == UIEventSubtypeMotionShake)
    {
    self.labelOne.text = plistArray[randomValue];
    cell.backgroundColor = _colour.colourArray[indexPath.item];
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
