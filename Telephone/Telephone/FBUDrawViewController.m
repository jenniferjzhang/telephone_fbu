//
//  FBUDrawViewController.m
//  Telephone
//
//  Created by Jennifer Zhang on 7/7/14.
//  Copyright (c) 2014 FacebookU. All rights reserved.
//

#import "FBUDrawViewController.h"
#import "FBUDrawView.h"
#import "FBUYourTurnViewController.h"
#import "FBUImageStore.h"
#import "FBURoundCounter.h"

@implementation FBUDrawViewController

@synthesize timer;
@synthesize timerLabel;

int secondsRemaining;
unsigned long roundNumber = 0;
-(void)viewDidLoad {
    [super viewDidLoad];
    
    secondsRemaining = 16;
    [self countdownTimer];
    
    red = 0.0;
    green = 0.0;
    blue = 0.0;
    brush = 10.0;
    opacity = 1.0;
    

    
}

-(void)viewWillAppear:(BOOL)animated
{
    roundNumber += 1;
    self.roundLabel.text = [NSString stringWithFormat:@"Round: %lu", (unsigned long) roundNumber];
    [[FBURoundCounter sharedCounter] decreaseCounter];
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

    if (secondsRemaining == 0) {
        [self performSegueWithIdentifier:@"yourTurnSegue" sender:self];
        [timer invalidate];
        FBUImageStore *pastImages = [FBUImageStore sharedStore];
        if (self.lastImage) {
            [pastImages setImage:self.lastImage forKey:@"lastImage"];
        }
    }
}

- (NSUInteger)supportedInterfaceOrientations
{
    //On all devices, we only support landscape left or right
    return UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight;
}
- (IBAction)pencilPressed:(id)sender {
    UIButton *pressedButton = (UIButton *)sender;
    
    switch(pressedButton.tag)
    {
    case 0:
        red = 0.0/255.0;
        green = 0.0/255.0;
        blue = 0.0/255.0;
        break;
    case 1:
        red = 255.0/255.0;
        green = 0/255.0;
        blue = 0/255.0;
        break;
    case 2:
        red = 255.0/255.0;
        green = 102.0/255.0;
        blue = 0.0/255.0;
        break;
    case 3:
        red = 255.0/255.0;
        green = 240.0/255.0;
        blue = 0.0/255.0;
        break;
    case 4:
        red = 0.0/255.0;
        green = 250.0/255.0;
        blue = 0.0/255.0;
        break;
    case 5:
        red = 51.0/255.0;
        green = 102.0/255.0;
        blue = 153.0/255.0;
        break;
    case 6:
        red = 102.0/255.0;
        green = 0.0/255.0;
        blue = 153.0/255.0;
        break;
    }
}



- (IBAction)doneDrawing:(id)sender {
    [timer invalidate];
    FBUImageStore *pastImages = [FBUImageStore sharedStore];
    if (self.lastImage) {
        [pastImages setImage:self.lastImage forKey:@"lastImage"];
    }
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
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), lastPoint.x + 1.0, lastPoint.y);
        CGContextFlush(UIGraphicsGetCurrentContext());
        
        CGContextStrokePath(UIGraphicsGetCurrentContext());
        self.seeImage.image = UIGraphicsGetImageFromCurrentImageContext();
        [self.seeImage setAlpha:opacity];
        UIGraphicsEndImageContext();
    }
    self.lastImage = self.seeImage.image;
    NSLog(@"Touch ended with picture %@", self.seeImage.image);
}

- (IBAction)clearScreen:(id)sender {
    UIGraphicsBeginImageContext(self.view.frame.size);
    self.seeImage.image = UIGraphicsGetImageFromCurrentImageContext();
    self.lastImage = self.seeImage.image;
    UIGraphicsEndImageContext();
}

@end
