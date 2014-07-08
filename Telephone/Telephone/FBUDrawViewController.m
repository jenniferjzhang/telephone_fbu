//
//  FBUDrawViewController.m
//  Telephone
//
//  Created by Jennifer Zhang on 7/7/14.
//  Copyright (c) 2014 FacebookU. All rights reserved.
//

#import "FBUDrawViewController.h"

@implementation FBUDrawViewController

@synthesize counterLabel;

int seconds;
int secondsRemaining;

-(void) viewDidLoad {
    [super viewDidLoad];
    
    secondsRemaining = 10;
    [self countdownTimer];
}

-(void)countdownTimer
{
    timer = [NSTimer timerWithTimeInterval:10 target:(id) counterLabel selector:@selector(viewDidLoad) userInfo:nil repeats:YES];
}

- (void) updateCounter:(NSTimer *)counter {
    if (secondsRemaining > 0) {
        secondsRemaining--;
        seconds = 10-secondsRemaining;
        counterLabel.text = [NSString stringWithFormat:@"%d", secondsRemaining];
    }
    else {
        secondsRemaining = 0;
    }
}

- (NSUInteger)supportedInterfaceOrientations
{
    //On all devices, we only support landscape left or right
    return UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight;
}

@end
