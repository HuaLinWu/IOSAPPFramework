//
//  NavigationViewURLHandle.m
//  IOSAPPFramework
//
//  Created by 吴华林 on 16/6/7.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import "NavigationViewURLHandle.h"

@implementation NavigationViewURLHandle
- (BOOL)openURL:(NSString *)url
{
    //先判断是否内否处理url，能处理就处理，不能处理就交给下一个节点
    NSURL *tempUrl = [NSURL URLWithString:url];
    if([self canHandleURL:tempUrl])
    {
        [self handleURL:tempUrl];
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
- (BOOL)canHandleURL:(NSURL *)url
{
   
    if([url.scheme caseInsensitiveCompare:NavHttpScheme])
    {
        return YES;
    }
    return NO;
}
- (void)handleURL:(NSURL *)url
{
    NSString *queryStr = url.query;
    NSString *navViewIdentifier = nil;
    NSString *navViewArgument = nil;
    NSArray  *parameterStringArray = [queryStr componentsSeparatedByString:@"&"];
    for(int i=0;i<parameterStringArray.count;i++)
    {
        NSString *parameterString = parameterStringArray[i];
        NSArray *keyAndValueArray = [parameterString componentsSeparatedByString:@"="];
        if(keyAndValueArray.count > 1)
        {
            NSString *key   = keyAndValueArray[0];
            NSString *value = keyAndValueArray[1];
            if([key caseInsensitiveCompare:NavURLViewIdentifierArgument])
            {
                //页面的唯一标示
                navViewIdentifier = value;
            }
            else if ([key caseInsensitiveCompare:NavURLViewArgument])
            {
                navViewArgument = value;
            }
        }
    }
    
}
@end
