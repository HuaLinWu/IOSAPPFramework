//
//  URLRouter.m
//  IOSAPPFramework
//
//  Created by 吴华林(平安好房技术中心产品研发部IOS研发团队) on 16/8/15.
//  Copyright © 2016年 吴华林(平安好房技术中心产品研发部IOS研发团队). All rights reserved.
//

#import "URLRouter.h"
#import "URLAnalyzing.h"
@implementation URLRouter

+ (void)openURL:(NSString *)url{
    if([URLAnalyzing isValidURL:url]){
        NSDictionary *paramsDict = [URLAnalyzing getURLParamsWithURL:url];
        //表示有效的URL
        switch ([URLAnalyzing checkURLType:url]) {
            case APPNATIVEVIEWURL:{
                //本地页面
                
                break;
            }
            case APPNATIVEWEBURL:{
                //本地webview
                
                break;
            }
            case APPNATIVESERVICE:{
                //本地系统服务
                if(paramsDict){
                    NSString *url = [paramsDict objectForKey:@"url"];
                    NSURL *serviceURL = [NSURL URLWithString:url];
                    [[UIApplication sharedApplication] openURL:serviceURL];
                }
                break;
            }
            default:
                break;
        }
    }
}
@end


