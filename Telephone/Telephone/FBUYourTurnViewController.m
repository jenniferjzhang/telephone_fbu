//
//  FBUYourTurnViewController.m
//  Telephone
//
//  Created by Jennifer Zhang on 7/8/14.
//  Copyright (c) 2014 FacebookU. All rights reserved.
//

#import "FBUYourTurnViewController.h"

@implementation FBUYourTurnViewController

- (IBAction)viewDrawing:(id)sender {
    [UIView animateKeyframesWithDuration:1.0
                                   delay:0
                                 options:UIViewAnimationCurveEaseInOut
                              animations:^{
                                  self.yourTurnLabel.center = CGPointMake(self.view.center.x, 50);
                                
                              }completion:NULL];
}

@end
