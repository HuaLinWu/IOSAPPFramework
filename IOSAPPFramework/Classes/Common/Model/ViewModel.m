//
//  ViewModel.m
//  IOSAPPFramework
//
//  Created by 吴华林 on 16/6/8.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import "ViewModel.h"

@implementation ViewModel
+ (instancetype)shareModel
{
    static ViewModel *model = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        model = [[[self class] alloc] init];
    });
    return model;
}
@end
