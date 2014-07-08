//
//  FBUHomeViewController.h
//  Telephone
//
//  Created by Jennifer Zhang on 7/8/14.
//  Copyright (c) 2014 FacebookU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FBUHomeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *playersLabel;
@property (weak, nonatomic) IBOutlet UITextField *numberOfPlayers;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *instructionsButton;
@property (weak, nonatomic) IBOutlet UIImageView *instructionsImage;


@end
