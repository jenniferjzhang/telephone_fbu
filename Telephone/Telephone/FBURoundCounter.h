//
//  FBURoundCounter.h
//  Telephone
//
//  Created by Garron Charles on 7/9/14.
//  Copyright (c) 2014 FacebookU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FBURoundCounter : NSObject

@property (nonatomic) NSUInteger roundCount;
@property (nonatomic) NSString *keyWord;
@property (nonatomic) BOOL confirmation;

+(instancetype)sharedCounter;

-(void)decreaseCounter;

@end
