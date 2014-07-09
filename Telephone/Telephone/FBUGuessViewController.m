//
//  FBUGuessViewController.m
//  Telephone
//
//  Created by Jennifer Zhang on 7/9/14.
//  Copyright (c) 2014 FacebookU. All rights reserved.
//

#import "FBUGuessViewController.h"
#import "FBURoundCounter.h"

@implementation FBUGuessViewController


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if ([[FBURoundCounter sharedCounter].keyWord caseInsensitiveCompare:self.guessTextField.text] == NSOrderedSame) {
        
        [FBURoundCounter sharedCounter].confirmation = YES;
    } else {
    
    [FBURoundCounter sharedCounter].confirmation = NO;

    }
}


@end
