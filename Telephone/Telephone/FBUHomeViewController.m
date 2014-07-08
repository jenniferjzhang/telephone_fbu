//
//  FBUHomeViewController.m
//  Telephone
//
//  Created by Jennifer Zhang on 7/8/14.
//  Copyright (c) 2014 FacebookU. All rights reserved.
//

#import "FBUHomeViewController.h"

@implementation FBUHomeViewController


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
