//
//  UIWebView+NSURLCache.m
//  IOSAPPFramework
//
//  Created by 吴华林(平安好房技术中心产品研发部IOS研发团队) on 16/6/23.
//  Copyright © 2016年 吴华林(平安好房技术中心产品研发部IOS研发团队). All rights reserved.
//

#import "UIWebView+NSURLCache.h"
#import <objc/runtime.h>
@interface UIWebView_cache () <UIWebViewDelegate>
@property(nonatomic,strong)NSURLCache *urlCache;
@end
@implementation UIWebView_cache
@dynamic cachePolicy,diskCapacity,diskPath,memoryCapacity,cacheDelegate;
- (instancetype)initWithFrame:(CGRect)frame
{
    NSInteger diskCapacity = 20*1024*1024;
    NSInteger memoryCapacity = 4*1024*1024;
    NSString  *path = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"webViewCache"];
    UIWebViewCachePolicy cachePolicy = UIWebViewUseProtocolCachePolicy;
    self = [self initWithMemoryCapacity:memoryCapacity diskCapacity:diskCapacity diskPath:path cachePolicy:cachePolicy];
    self.frame = frame;
   return self;
}
#pragma mark 
- (instancetype)initWithMemoryCapacity:(NSUInteger)memoryCapacity diskCapacity:(NSUInteger)diskCapacity diskPath:(NSString *)path cachePolicy:(UIWebViewCachePolicy)cachePolicy
{
    self = [super init];
    if(self)
    {
        self.diskPath = path;
        self.memoryCapacity = memoryCapacity;
        self.diskCapacity = diskCapacity;
        self.cachePolicy  = cachePolicy;
        self.delegate = self;
    }
    return self;
}
#pragma mark UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if([self.cacheDelegate respondsToSelector:@selector(webView:shouldStartLoadWithRequest:navigationType:)])
    {
       return [self.cacheDelegate webView:webView shouldStartLoadWithRequest:request navigationType:navigationType];
    }
    return NO;
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
   if([self.cacheDelegate respondsToSelector:@selector(webViewDidStartLoad:)])
    {
        [self.cacheDelegate webViewDidStartLoad:webView];
    }
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    if([self.cacheDelegate respondsToSelector:@selector(webViewDidFinishLoad:)])
    {
        [self.cacheDelegate webViewDidFinishLoad:webView];
    }
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error
{
    if([self.cacheDelegate respondsToSelector:@selector(webView:didFailLoadWithError:)])
    {
        [self.cacheDelegate webView:webView didFailLoadWithError:error];
    }
}

#pragma mark set/get

- (NSURLCache *)urlCache
{
    if(!_urlCache)
    {
      _urlCache = [[NSURLCache alloc] initWithMemoryCapacity:self.memoryCapacity diskCapacity:self.diskCapacity diskPath:self.diskPath];
    }
    return _urlCache;
}
@end
