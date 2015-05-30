//
//  ViewController.m
//  ShakeDetect
//
//  Created by Bianca Binstock on 2015-05-22.
//  Copyright (c) 2015 Bianca Binstock. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()



@end

@implementation ViewController
{
    NSArray *_colors;
    AVAudioPlayer *_audioPlayer;
    NSMutableArray *_plistArray;
    NSMutableArray *_plistSounds;
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.labelOne = [[UILabel alloc]initWithFrame:CGRectMake(50, 150, 200, 70)];
    self.labelOne.text = @"Shake Me!";
    [self.labelOne setFont:[UIFont fontWithName:@"Helvetica-Bold" size:40.0]];
   self.labelOne.textColor = [UIColor whiteColor];
    [self.view addSubview:_labelOne];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"words" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    _plistArray = dict[@"words"];
    
    _plistSounds = dict[@"funkySounds"];
    
//    background color
    self.view.backgroundColor = [UIColor yellowColor];
    _colors = [self randomColour];
//    _audioPlayer = [[AVAudioPlayer alloc] init];
}

//do i create a function from this and put in motionEnded?
-(NSArray*)randomColour
{
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
    return [NSArray arrayWithArray:tempArray];
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"words" ofType:@"plist"];
//    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
//    NSMutableArray *plistArray = dict[@"words"];
//    NSMutableArray *plistSounds = dict[@"funkySounds"];
    int randomValue = arc4random() % _plistArray.count;
    int randomSound = arc4random() % _plistSounds.count;
    if (motion == UIEventSubtypeMotionShake)
    {
        self.labelOne.text = _plistArray[randomValue];
        self.funkySounds = _plistSounds[randomSound];
        NSInteger randomIndex = arc4random() % 100;
        self.view.backgroundColor = _colors[randomIndex];
        NSString *folderName = @"funkySounds";
        NSURL *url = [[NSBundle mainBundle] URLForResource:[folderName stringByAppendingPathComponent:self.funkySounds] withExtension:nil];
        _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        [_audioPlayer play];
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
