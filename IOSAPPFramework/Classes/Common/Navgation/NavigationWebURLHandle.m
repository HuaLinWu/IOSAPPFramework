//
//  NavigationWebURLHandle.m
//  IOSAPPFramework
//
//  Created by 吴华林(平安好房技术中心产品研发部IOS研发团队) on 16/6/7.
//  Copyright © 2016年 吴华林(平安好房技术中心产品研发部IOS研发团队). All rights reserved.
//

#import "NavigationWebURLHandle.h"
#import "RootWebViewController.h"
@implementation NavigationWebURLHandle
- (BOOL)openURL:(NSString *)url
{
    //先判断是否内否处理url，能处理就处理，不能处理就交给下一个节点
    if([self canHandleURL:url])
    {
        [self handleURL:url];
        return YES;
    }
    else
    {
        if(self.nextURLHandle)
        {
            return [self.nextURLHandle openURL:url];
        }
        else
        {
            return NO;
        }
    }
}
- (BOOL)canHandleURL:(NSString *)urlStr
{
    NSURL *tempUrl = [NSURL URLWithString:urlStr];
    if((([tempUrl.scheme caseInsensitiveCompare:@"http"] == NSOrderedSame)
    || ([tempUrl.scheme caseInsensitiveCompare:@"https"] == NSOrderedSame)
    || ([tempUrl.scheme caseInsensitiveCompare:@"ftp"] == NSOrderedSame)
    || ([tempUrl.scheme caseInsensitiveCompare:@"ftps"] == NSOrderedSame)
    || ([tempUrl.scheme caseInsensitiveCompare:@"data"] == NSOrderedSame)
    || ([tempUrl.scheme caseInsensitiveCompare:@"file"] == NSOrderedSame)))
    {
        
    }
    return NO;
}
- (void)handleURL:(NSString *)url
{
    
}

@end
