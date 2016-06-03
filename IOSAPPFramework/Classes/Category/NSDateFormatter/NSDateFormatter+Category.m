//
//  NSDateFormatter+Category.m
//  IOSAPPFramework
//
//  Created by 吴华林 on 16/5/31.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import "NSDateFormatter+Category.h"

@implementation NSDateFormatter (Category)
/**
 *  单例
 */
+ (NSDateFormatter *)staticDateFormatter
{
    static NSDateFormatter *staticDateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        staticDateFormatter = [[NSDateFormatter alloc] init];
    });
    return staticDateFormatter;
}
@end
