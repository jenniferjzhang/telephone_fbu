//
//  FBUDrawViewController.h
//  Telephone
//
//  Created by Jennifer Zhang on 7/7/14.
//  Copyright (c) 2014 FacebookU. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FBUDrawView;

@interface FBUDrawViewController : UIViewController
{
    CGPoint lastPoint;
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    CGFloat opacity;
    CGFloat brush;
    BOOL mouseSwiped;
}
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet FBUDrawView *drawPane;
@property (nonatomic, retain) NSTimer *timer;
-(void) updateCounter;
-(void) countdownTimer;

@end
