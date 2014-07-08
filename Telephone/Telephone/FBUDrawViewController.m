//
//  FBUDrawViewController.m
//  Telephone
//
//  Created by Jennifer Zhang on 7/7/14.
//  Copyright (c) 2014 FacebookU. All rights reserved.
//

#import "FBUDrawViewController.h"
#import "FBUDrawView.h"

@implementation FBUDrawViewController

@synthesize timer;
@synthesize timerLabel;

int secondsRemaining;
-(void)viewDidLoad {
    [super viewDidLoad];
    
    secondsRemaining = 11;
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
    if (secondsRemaining > 0) {
        secondsRemaining--;
        timerLabel.text = [NSString stringWithFormat:@"%d seconds left", secondsRemaining];
    }
    
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
    NSLog(@"Touch began");
    mouseSwiped = NO;
    UITouch *touch = [touches anyObject];
    lastPoint = [touch locationInView:self.view];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    //Get the location of the touch
    NSLog(@"Touch moved");
    mouseSwiped = YES;
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self.view];
    
    //Draw the tiny section of line
    UIGraphicsBeginImageContext(self.view.frame.size);
    [self.seeImage.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), brush);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), red, green, blue, 1.0);
    CGContextSetBlendMode(UIGraphicsGetCurrentContext(), kCGBlendModeNormal);
    
    //Set the image in the draw view to be the image
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    self.seeImage.image = UIGraphicsGetImageFromCurrentImageContext();
    [self.seeImage setAlpha:opacity];
    UIGraphicsEndImageContext();
    
    lastPoint = currentPoint;
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (!mouseSwiped) {
        UIGraphicsBeginImageContext(self.view.frame.size);
        [self.seeImage.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
        CGContextSetLineWidth(UIGraphicsGetCurrentContext(), brush);
        CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), red, green, blue, 1.0);
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
        CGContextFlush(UIGraphicsGetCurrentContext());
        self.seeImage.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    NSLog(@"Touch ended with picture %@", self.seeImage.image);
}

@end
