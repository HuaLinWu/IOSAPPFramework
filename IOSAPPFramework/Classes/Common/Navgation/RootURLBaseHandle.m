//
//  RootURLBaseHandle.m
//  IOSAPPFramework
//
//  Created by 吴华林 on 16/6/8.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import "RootURLBaseHandle.h"

@implementation RootURLBaseHandle
+ (instancetype)shareHandle
{
    static RootURLBaseHandle *handle = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        handle = [[self class] init];
    });
    return handle;
}
- (BOOL)openURL:(NSString *)url
{
    return NO;
}
@end
