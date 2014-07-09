//
//  FBUYourTurnViewController.m
//  Telephone
//
//  Created by Jennifer Zhang on 7/8/14.
//  Copyright (c) 2014 FacebookU. All rights reserved.
//

#import "FBUYourTurnViewController.h"
#import "FBUImageStore.h"

@interface FBUYourTurnViewController ()

@property (nonatomic, retain) NSTimer *timer;
@property (weak, nonatomic) IBOutlet UIImageView *pastImage;

@end

@implementation FBUYourTurnViewController

int secondsRemaining ;
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    secondsRemaining = 5;
    
    self.pastImage.image = [[FBUImageStore sharedStore] imageForKey:@"lastImage"];
}

-(void)countdownTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                             target:self
                                           selector:@selector(updateCounter)
                                           userInfo:nil
                                            repeats:YES];
}

- (void) updateCounter {
    if (secondsRemaining > 0) {
        secondsRemaining--;
        self.timerLabel.text = [NSString stringWithFormat:@"%d seconds left", secondsRemaining];
        
    }
    
    if (secondsRemaining == 0) {
        [self performSegueWithIdentifier:@"nextDraw" sender:self];
        [self.timer invalidate];
        
        }
}

- (IBAction)viewDrawing:(id)sender {
    [UIView animateKeyframesWithDuration:1.0
                                   delay:0
                                 options:UIViewAnimationCurveEaseInOut
                              animations:^{
                                  
                                self.yourTurnLabel.center = CGPointMake(self.view.center.x, 50);
                                
                              }completion:^(BOOL completed){
                                  if (completed == YES) {
                                      [self.pastImage setHidden:NO];
                                      [[FBUImageStore sharedStore] deleteImageForKey:@"lastImage"];
                                      [self countdownTimer];
                                  }
                                  
                              }];
    
}

@end
