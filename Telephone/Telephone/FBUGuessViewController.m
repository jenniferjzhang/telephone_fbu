//
//  FBUGuessViewController.m
//  Telephone
//
//  Created by Jennifer Zhang on 7/9/14.
//  Copyright (c) 2014 FacebookU. All rights reserved.
//

#import "FBUGuessViewController.h"

@implementation FBUGuessViewController


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
