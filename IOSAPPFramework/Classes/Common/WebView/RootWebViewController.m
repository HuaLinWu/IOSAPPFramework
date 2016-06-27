//
//  RootWebViewController.m
//  IOSAPPFramework
//
//  Created by 吴华林 on 16/6/7.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import "RootWebViewController.h"
#import "UIWebView+NSURLCache.h"
@interface RootWebViewController()
@property(nonatomic,strong)UIWebViewCahe*webView;
@property(nonatomic,strong)NSURLRequest *urlRequest;
@property(nonatomic,strong)NSURL *url;
@end
@implementation RootWebViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.webView];
    //加载网页
    [self.webView loadRequest:self.urlRequest];
}

- (void)initNavigationBar
{
    [super initNavigationBar];
}

#pragma mark set/get
- (UIWebView *)webView
{
    if(!_webView)
    {
        _webView = [[UIWebViewCahe alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        _webView.allowsInlineMediaPlayback = YES;
        
    }
    return _webView;
}
- (NSURL *)url
{
    if(!_url)
    {
        _url = [NSURL URLWithString:self.urlStr];
    }
    return _url;
}
- (NSURLRequest *)urlRequest
{
    if(!_urlRequest)
    {
        _urlRequest = [NSURLRequest requestWithURL:self.url];
    }
    return _urlRequest;
}
@end
