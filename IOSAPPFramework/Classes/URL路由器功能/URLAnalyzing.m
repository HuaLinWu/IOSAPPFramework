//
//  URLAnalyzing.m
//  IOSAPPFramework
//
//  Created by 吴华林(平安好房技术中心产品研发部IOS研发团队) on 16/8/15.
//  Copyright © 2016年 吴华林(平安好房技术中心产品研发部IOS研发团队). All rights reserved.
//

#import "URLAnalyzing.h"

@implementation URLAnalyzing

+ (BOOL)isValidURL:(NSString *)url{
    
    if(!url){
        
        return NO;
    }
    NSURL *tempURL   = [NSURL URLWithString:url];
    if([self isWebURL:tempURL]){
        
        return YES;
        
    }else if ([self isNativeViewURL:tempURL]){
       
        return YES;
        
    }else if([self isNativeServiceURL:tempURL]){
        
        return YES;
    }
    return NO;
}

+ (URLType)checkURLType:(NSString *)url{
    if(!url){
        return NOVALIDURL;
    }
    NSURL *tempURL   = [NSURL URLWithString:url];
    if([self isWebURL:tempURL]){
        
        return APPNATIVEWEBURL;
        
    }else if ([self isNativeViewURL:tempURL]){
        
        return APPNATIVEVIEWURL;
        
    }else if([self isNativeServiceURL:tempURL]){
        
        return  APPNATIVESERVICE;
    }
    return NOVALIDURL;
}

+ (NSDictionary *)getURLParamsWithURL:(NSString *)url{
    
    if(!url){
        return nil;
    }
    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    NSRange range1  = [url rangeOfString:@"?"];
    NSRange range2  = [url rangeOfString:@"#"];
    NSRange range   ;
    if (range1.location != NSNotFound) {
        range = NSMakeRange(range1.location, range1.length);
    }else if (range2.location != NSNotFound){
        range = NSMakeRange(range2.location, range2.length);
    }else{
        range = NSMakeRange(-1, 1);
    }
    if (range.location != NSNotFound) {
        NSString * paramString = [url substringFromIndex:range.location+1];
        NSArray * paramCouples = [paramString componentsSeparatedByString:@"&"];
        for (int i = 0; i < [paramCouples count]; i++) {
            NSArray * param = [[paramCouples objectAtIndex:i] componentsSeparatedByString:@"="];
            if ([param count] == 2) {
                [dic setObject:[[param objectAtIndex:1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding] forKey:[[param objectAtIndex:0] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
            }
        }
        return dic;
    }
    return nil;

}

#pragma mark private
+ (BOOL)isWebURL:(NSURL*)URL {
    
    if(!URL){
        return NO;
    }
    return ([URL.scheme caseInsensitiveCompare:@"http"] == NSOrderedSame)
    || ([URL.scheme caseInsensitiveCompare:@"https"] == NSOrderedSame)
    || ([URL.scheme caseInsensitiveCompare:@"ftp"] == NSOrderedSame)
    || ([URL.scheme caseInsensitiveCompare:@"ftps"] == NSOrderedSame)
    || ([URL.scheme caseInsensitiveCompare:@"data"] == NSOrderedSame)
    || ([URL.scheme caseInsensitiveCompare:@"file"] == NSOrderedSame);
}
+ (BOOL)isNativeViewURL:(NSURL *)URL{
    
    if(!URL){
        return NO;
    }
    return ([URL.scheme caseInsensitiveCompare:APPNATIVEVIEWURLSCHEME]==NSOrderedSame);
}

+ (BOOL)isNativeServiceURL:(NSURL *)URL{
    
    if(!URL){
        return NO;
    }
    return ([URL.scheme caseInsensitiveCompare:APPNATIVESERVICEURLSCHEME]==NSOrderedSame);
}
@end
