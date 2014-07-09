//
//  FBUWordViewController.m
//  Telephone
//
//  Created by Jennifer Zhang on 7/8/14.
//  Copyright (c) 2014 FacebookU. All rights reserved.
//

#import "FBUWordViewController.h"
#import "FBURoundCounter.h"

@implementation FBUWordViewController

- (NSUInteger)supportedInterfaceOrientations
{
    //On all devices, we only support landscape left or right
    return UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    if (![FBURoundCounter sharedCounter].keyWord){
        
        [self generateWord];

    }
    self.wordLabel.text = [FBURoundCounter sharedCounter].keyWord;
    if ([FBURoundCounter sharedCounter].confirmation == YES){
        self.confirmationLabel.text = @"You're right!";
    } else {
        self.confirmationLabel.text = @"Sorry...";
    }
}

- (void)generateWord
{
    NSArray *wordDB = @[@"Hello Kitty", @"Facebook", @"Breaking Bad", @"TJ", @"Big Nerd Ranch", @"Pikachu", @"Democracy", @"Friendship",
                        @"Woody", @"Party", @"UFO"];
    
    NSString *keyword = wordDB[arc4random() % wordDB.count];
    [[FBURoundCounter sharedCounter] setKeyWord:keyword];

}

@end
