//
//  FBUImageStore.h
//  Telephone
//
//  Created by Garron Charles on 7/8/14.
//  Copyright (c) 2014 FacebookU. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FBUImageStore : NSObject

+(instancetype)sharedStore;

-(void)setImage:(UIImage *)image forKey:(NSString *)key;
-(UIImage *)imageForKey:(NSString *)key;
-(void)deleteImageForKey:(NSString *)key;

@end
