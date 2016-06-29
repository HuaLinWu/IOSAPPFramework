//
//  UIWebView+NSURLCache.h
//  IOSAPPFramework
//  带缓存的webview
//  Created by 吴华林(平安好房技术中心产品研发部IOS研发团队) on 16/6/23.
//  Copyright © 2016年 吴华林(平安好房技术中心产品研发部IOS研发团队). All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWebView (NSURLCache)
/**
 *  加载地址
 *
 *  @param urlStr url 地址
 */
- (void)loadURL:(NSString *)urlStr;
@end


