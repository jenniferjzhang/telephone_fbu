//
//  FBUImageStore.m
//  Telephone
//
//  Created by Garron Charles on 7/8/14.
//  Copyright (c) 2014 FacebookU. All rights reserved.
//

#import "FBUImageStore.h"
@interface FBUImageStore ()

@property (nonatomic, strong) NSMutableDictionary *dictionary;

@end

@implementation FBUImageStore

//No one should call init
-(instancetype)init
{
    [NSException raise:@"Singleton"
                format:@"Use +[GMCImageStore sharedStore]"];
    return nil;
}

//Secret designated initializer
-(instancetype)initPrivate
{
    self = [super init];
    
    if (self) {
        _dictionary = [[NSMutableDictionary alloc] init];
        
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        [nc addObserver:self
               selector:@selector(clearCache:)
                   name:UIApplicationDidReceiveMemoryWarningNotification
                 object:nil];
    }
    return self;
}

-(void)clearCache:(NSNotification *)note
{
    NSLog(@"flushing %@ images out of the cache", @([self.dictionary count]));
    [self.dictionary removeAllObjects];
}

+(instancetype)sharedStore
{
    static FBUImageStore *sharedStore;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedStore = [[self alloc] initPrivate];
    });
    return sharedStore;
}

-(void)setImage:(UIImage *)image forKey:(NSString *)key
{
    if (self.dictionary[key]) {
        [self deleteImageForKey:key];
    }
    self.dictionary[key] = image;
    
    //Create full path for image
    NSString *imagePath = [self imagePathForKey:key];
    
    //Turn image into JPEG data
    NSData *data = UIImageJPEGRepresentation(image, 0.5);
    
    //Write it to full path
    [data writeToFile:imagePath atomically:YES];
}

-(void)deleteImageForKey:(NSString *)key
{
    if (!key) {
        return;
    }
    [self.dictionary removeObjectForKey:key];
    
    NSString *imagePath = [self imagePathForKey:key];
    [[NSFileManager defaultManager] removeItemAtPath:imagePath
                                               error:NULL];
}

-(NSString *)imagePathForKey:(NSString *)key
{
    NSArray *documentDirectories =
    NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                        NSUserDomainMask,
                                        YES);
    
    NSString *documentDirectory = [documentDirectories firstObject];
    return [documentDirectory stringByAppendingPathComponent:key];
}

@end
