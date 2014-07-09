//
//  FBURoundCounter.m
//  Telephone
//
//  Created by Garron Charles on 7/9/14.
//  Copyright (c) 2014 FacebookU. All rights reserved.
//

#import "FBURoundCounter.h"

@implementation FBURoundCounter

//No one should call init
-(instancetype)init
{
    [NSException raise:@"Singleton"
                format:@"Use +[FBURoundCounter sharedCounter]"];
    return nil;
}

-(instancetype)initPrivate
{
    self = [super init];
    
    return self;
}

+(instancetype)sharedCounter{
    static FBURoundCounter *sharedCounter;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedCounter= [[super alloc] initPrivate];
    });
    return sharedCounter;
}

-(void)decreaseCounter
{
    self.roundCount -= 1;
}

@end
