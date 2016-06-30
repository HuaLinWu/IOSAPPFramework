//
//  UIWebView+NSURLCache.h
//  IOSAPPFramework
//  带缓存的webview
//  Created by 吴华林 on 16/6/23.
//  Copyright © 2016年 吴华林. All rights reserved.
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


