//
//  FBUYourTurnViewController.m
//  Telephone
//
//  Created by Jennifer Zhang on 7/8/14.
//  Copyright (c) 2014 FacebookU. All rights reserved.
//

#import "FBUYourTurnViewController.h"
#import "FBUImageStore.h"
#import "FBURoundCounter.h"

@interface FBUYourTurnViewController ()

@property (nonatomic, retain) NSTimer *timer;
@property (weak, nonatomic) IBOutlet UIImageView *pastImage;

@end

@implementation FBUYourTurnViewController

int secondsRemaining ;
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    secondsRemaining = 4;
    
    [self.viewDrawingButton setHidden:NO];
    [self.viewDrawingButton setEnabled:YES];
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
        if (secondsRemaining == 1) {
            self.timerLabel.text = [NSString stringWithFormat:@"%d second left", secondsRemaining];
        }
        self.timerLabel.text = [NSString stringWithFormat:@"%d seconds left", secondsRemaining];
        
    }
    
    if (secondsRemaining == 0) {
        if ([FBURoundCounter sharedCounter].roundCount != 0) {
            [self performSegueWithIdentifier:@"nextDraw" sender:self];
            [self.timer invalidate];
        }else {
            [self performSegueWithIdentifier:@"guessView" sender:self];
            [self.timer invalidate];
        }
        
        
        
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
                                      
                                      //Hide and disable button
                                      [self.viewDrawingButton setEnabled:NO];
                                      [self.viewDrawingButton setHidden:YES];
                                  }
                                  
                              }];
    
}

@end
