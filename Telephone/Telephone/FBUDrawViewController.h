//
//  FBUDrawViewController.h
//  Telephone
//
//  Created by Jennifer Zhang on 7/7/14.
//  Copyright (c) 2014 FacebookU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FBUDrawViewController : UIViewController
{
    NSTimer *timer;
    IBOutlet UILabel *counterLabel;
}

@property (nonatomic, retain) NSTimer *timer;
@property (nonatomic, retain) UILabel *counterLabel;
//@property (nonatomic, weak) IBOutlet FBUDrawView *label;
-(void) updateCounter;
-(void) countdownTimer;

@end
