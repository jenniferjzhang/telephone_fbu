//
//  FBUDrawViewController.m
//  Telephone
//
//  Created by Jennifer Zhang on 7/7/14.
//  Copyright (c) 2014 FacebookU. All rights reserved.
//

#import "FBUDrawViewController.h"

@implementation FBUDrawViewController

@synthesize timer;
@synthesize timerLabel;

int seconds;
int secondsRemaining;

-(void)viewDidLoad {
    [super viewDidLoad];
    
    secondsRemaining = 10;
    [self countdownTimer];
    
    red = 0.0;
    green = 0.0;
    blue = 0.0;
    brush = 10.0;
    opacity = 1.0;
    
    
}

-(void)countdownTimer
{
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                             target:self
                                           selector:@selector(updateCounter)
                                           userInfo:nil
                                            repeats:YES];
}

- (void) updateCounter {
    secondsRemaining--;
    seconds = 10-secondsRemaining;
    timerLabel.text = [NSString stringWithFormat:@"%d", secondsRemaining];
}

- (NSUInteger)supportedInterfaceOrientations
{
    //On all devices, we only support landscape left or right
    return UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight;
}
- (IBAction)doneDrawing:(id)sender {
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    mouseSwiped = NO;
    UITouch *touch = [touches anyObject];
    lastPoint = [touch locationInView:self.view];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    mouseSwiped = YES;
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self.view];
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    
}

@end
