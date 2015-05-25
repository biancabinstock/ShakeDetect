//
//  ViewController.h
//  ShakeDetect
//
//  Created by Bianca Binstock on 2015-05-22.
//  Copyright (c) 2015 Bianca Binstock. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

-(BOOL)canBecomeFirstResponder;

@property(strong,nonatomic)UILabel* labelOne;
@property (strong, nonatomic) NSArray *colourArray;
//@property (strong, nonatomic) Colour *colour;

-(NSArray*) randomColour;
@end

