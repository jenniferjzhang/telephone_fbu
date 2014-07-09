//
//  FBUWordViewController.m
//  Telephone
//
//  Created by Jennifer Zhang on 7/8/14.
//  Copyright (c) 2014 FacebookU. All rights reserved.
//

#import "FBUWordViewController.h"

@implementation FBUWordViewController

- (NSUInteger)supportedInterfaceOrientations
{
    //On all devices, we only support landscape left or right
    return UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.wordLabel.text = [self generateWord];
}

- (NSString *)generateWord
{
    NSArray *wordDB = @[@"Hello Kitty", @"Facebook", @"Breaking Bad", @"TJ", @"Big Nerd Ranch", @"Pikachu", @"Democracy", @"Friendship",
                        @"Woody", @"Party"];
    
    return wordDB[arc4random() % wordDB.count];
}

@end
