//
//  RootWebViewController.h
//  IOSAPPFramework
//   显示webURL 本地的url
//  Created by 吴华林 on 16/6/7.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import "RootViewController.h"

@interface RootWebViewController : RootViewController
@property(nonatomic,strong,readonly)UIWebView *webView;
/**
 *  需要加载的url
 */
@property(nonatomic,copy)NSString *urlStr;
@end
