//
//  FBUHomeViewController.m
//  Telephone
//
//  Created by Jennifer Zhang on 7/8/14.
//  Copyright (c) 2014 FacebookU. All rights reserved.
//

#import "FBUHomeViewController.h"
#import "FBURoundCounter.h"

@implementation FBUHomeViewController

-(void)viewDidAppear:(BOOL)animated
{
    
    [UIView animateKeyframesWithDuration:1.0
                                   delay:1.0
                                 options:UIViewAnimationOptionCurveEaseIn
                              animations:^{
                                  
                                  self.titleLabel.center = CGPointMake(self.view.center.x, 60);
                                  
                              }completion:^(BOOL completed){
                                  if (completed == YES) {
                                      [self.playersLabel setHidden:NO];
                                      [self.numberOfPlayers setHidden:NO];
                                      [self.startButton setHidden:NO];
                                      [self.startButton setEnabled:NO];
                                      [self.instructionsImage setHidden:NO];
                                      [self.instructionsButton setEnabled:YES];
                                      [self.instructionsButton setHidden:NO];
                                  }
                              }];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.startButton setEnabled:NO];

}
    
    

- (NSUInteger)supportedInterfaceOrientations
{
    //On all devices, we only support landscape left or right
    return UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [[FBURoundCounter sharedCounter] setRoundCount:[textField.text integerValue]];
    if ([FBURoundCounter sharedCounter].roundCount != 0) {
        [self.startButton setEnabled:YES];
    }
    NSLog(@"%lu", (unsigned long) [FBURoundCounter sharedCounter].roundCount);
}

- (IBAction)backgroundTapped:(id)sender
{
    [self.view endEditing:YES];
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        
        self.instructionsImage.image = [UIImage imageNamed:@"questionmark.png"];
    }
    
    return self;
}

- (void)prepareViewsForOrientation:(UIInterfaceOrientation)orientation
{
    //Is it an iPad? No preparation necessary?
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        return;
    }
    
    //Is it landscape?
    if (UIInterfaceOrientationIsLandscape(orientation)) {
        self.instructionsImage.hidden = NO;
    }
}


@end
