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


@property (weak, nonatomic) IBOutlet UIImageView *pastImage;

@end

@implementation FBUYourTurnViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    self.pastImage.image = [[FBUImageStore sharedStore] imageForKey:@"lastImage"];
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
                                  }
                                  
                              }];
    
}

@end
