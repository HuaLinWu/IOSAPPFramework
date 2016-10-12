//
//  URLAnalyzing.h
//  IOSAPPFramework
//  url 解析类，返回需要返回应用里合格跳转的url
//  Created by 吴华林(平安好房技术中心产品研发部IOS研发团队) on 16/8/15.
//  Copyright © 2016年 吴华林(平安好房技术中心产品研发部IOS研发团队). All rights reserved.
//

#import <Foundation/Foundation.h>
#import "URLRule.m"
typedef NS_ENUM(NSInteger,URLType){
    
    NOVALIDURL       =0, //不是有效的URL
    APPNATIVEVIEWURL =2,//本地原生的页面的URL
    APPNATIVEWEBURL  =4,//本地webView的页面的URL
    APPNATIVESERVICE =8 //系统功能的URL
};

@interface URLAnalyzing : NSObject

/**
 *  url 是否是支持的url
 *  @return 如果是支持的url，返回YES，否则返回NO
 */
+ (BOOL)isValidURL:(NSString *)url;

/**
 *  检测URL的类型
 */
+ (URLType)checkURLType:(NSString *)url;

/**
 *  获取URL中携带的参数
 */
+ (NSDictionary *)getURLParamsWithURL:(NSString *)url;
@end
