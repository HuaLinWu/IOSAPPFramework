//
//  NSObject+KeyedArichiver.m
//  KeyedArichiverLibrary
//
//  Created by Steven on 16/9/12.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import "NSObject+KeyedArichiver.h"
#import <objc/runtime.h>
@implementation NSObject (KeyedArichiver)
- (void)encodeWithName:(NSString *)name{
    NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    if(!name||name.length==0){
        name = NSStringFromClass([self class]);
    }
    NSString *path =[rootPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.arichiver",name]];
    [NSKeyedArchiver archiveRootObject:self toFile:path];
}
+ (instancetype)decodeWithName:(NSString *)name{
    NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *path =[rootPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.arichiver",name]];
     return [NSKeyedUnarchiver unarchiveObjectWithFile:path];
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
   unsigned int outCount;
   Ivar *vars = class_copyIvarList([self class], &outCount);
    for(int i=0;i<outCount;i++){
        Ivar var = vars[i];
        NSString *name = [NSString stringWithUTF8String:ivar_getName(var)];
        id value = [self valueForKey:name];
        [aCoder encodeObject:value forKey:name];
    }
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [self init];
    if(self){
        unsigned int outCount;
        Ivar *vars = class_copyIvarList([self class], &outCount);
        for(int i=0;i<outCount;i++){
            Ivar var = vars[i];
            NSString *name = [NSString stringWithUTF8String:ivar_getName(var)];
            id value = [aDecoder decodeObjectForKey:name];
            [self setValue:value forKey:name];
        }
    }
    return self;
}
@end
