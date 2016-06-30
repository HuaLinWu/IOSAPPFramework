//
//  UIWebView+NSURLCache.m
//  IOSAPPFramework
//
//  Created by 吴华林 on 16/6/23.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import "UIWebView+NSURLCache.h"
@implementation UIWebView (NSURLCache)
- (void)loadURL:(NSString *)urlStr{
    
    if(!urlStr){
        return;
    }
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self loadRequest:urlRequest];
}
- (void)loadRequest:(NSURLRequest *)request{
    
    [self downLoadWithRequest:request];
}

/**
 *  加载requst 对应的数据
 */
- (void)downLoadWithRequest:(NSURLRequest *)request{
    
    __weak typeof(self)weakSelf = self;
    NSURLRequest *tempRequset = [self configRequestWithRequest:request];
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:tempRequset completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        __strong typeof(self) strongSelf = weakSelf;
        if(error)
        {
          //加载失败时候
          NSCachedURLResponse *cachedURLResponse = [strongSelf cachedURLResponseForRequest:tempRequset];
         [strongSelf loadData:cachedURLResponse.data response:cachedURLResponse.response request:tempRequset];
        }
        else{
            NSHTTPURLResponse *tempResponse = (NSHTTPURLResponse *)response;
            if(tempResponse.statusCode==200){
                //表示200成功
                NSURLCacheStoragePolicy cacheStoragePolicy = [strongSelf cacheStoragePolicyWithResponse:response];
            if(cacheStoragePolicy == NSURLCacheStorageAllowed){
              //表示需要缓存
              [strongSelf storeCacheForRequest:tempRequset response:response data:data];
              }
            [strongSelf loadData:data response:response request:tempRequset];
        }
        else if (tempResponse.statusCode ==304){
            //表示没有更新直接读取缓存就可以了
           NSCachedURLResponse *cachedURLResponse = [strongSelf cachedURLResponseForRequest:tempRequset];
          [strongSelf loadData:cachedURLResponse.data response:cachedURLResponse.response request:tempRequset];
         }
        }
    }];
    [dataTask resume];
}

/**
 *  加载data到webview
 */

- (void)loadData:(NSData *)data response:(NSURLResponse *)response request:(NSURLRequest *)request {
    
     [self loadData:data MIMEType:response.MIMEType textEncodingName:response.textEncodingName baseURL:request.URL];
}
/**
 *  根据requst 来查询缓存然后配置上次的response 的相关的信息来获取配置新的request
 */
- (NSURLRequest *)configRequestWithRequest:(NSURLRequest *)request{
    
    NSCachedURLResponse *cachedURLResponseresponse = [self cachedURLResponseForRequest:request];
    if(cachedURLResponseresponse){
     NSHTTPURLResponse *response =(NSHTTPURLResponse *)cachedURLResponseresponse.response;
     NSMutableURLRequest *mutableURLRequest = [[NSMutableURLRequest alloc] initWithURL:request.URL];
     [mutableURLRequest setValuesForKeysWithDictionary:request.allHTTPHeaderFields];
     mutableURLRequest.cachePolicy = request.cachePolicy;
     mutableURLRequest.timeoutInterval      = request.timeoutInterval;
     mutableURLRequest.mainDocumentURL      = request.mainDocumentURL;
     mutableURLRequest.networkServiceType   = request.networkServiceType;
     mutableURLRequest.allowsCellularAccess = request.allowsCellularAccess;
     NSString *cacheControl = [response.allHeaderFields objectForKey:@"Cache-Control"];
    [mutableURLRequest setValue:cacheControl forHTTPHeaderField:@"Cache-Control"];
     NSString *ifMatch = [response.allHeaderFields objectForKey:@"ETag"];
    [mutableURLRequest setValue:ifMatch forHTTPHeaderField:@"If-Match"];
    NSString *ifModifiedSince = [response.allHeaderFields objectForKey:@"Last-Modified"];
    [mutableURLRequest setValue:ifModifiedSince forHTTPHeaderField:@"If-Modified-Since"];
    NSString *ifNoneMatch = [response.allHeaderFields objectForKey:@"ETag"];
    [mutableURLRequest setValue:ifNoneMatch forHTTPHeaderField:@"If-None-Match"];
    NSString *ifRange = [response.allHeaderFields objectForKey:@"ETag"];
    [mutableURLRequest setValue:ifRange forHTTPHeaderField:@"If-Range"];
    return mutableURLRequest;
    }
    return request;
}
/**
 *  获取requst对应的缓存
 *
 */
- (NSCachedURLResponse *)cachedURLResponseForRequest:(NSURLRequest *)request{
    
    NSCachedURLResponse *cachedURLResponse =[[NSURLCache sharedURLCache] cachedResponseForRequest:request];
    return cachedURLResponse;
}
/**
 *  删除requst 对应的缓存
 *
 */
- (void)removeCacheForRequest:(NSURLRequest *)request{
    
    [[NSURLCache sharedURLCache] removeCachedResponseForRequest:request];
}
/**
 *  针对request 来存储response
 */
- (void)storeCacheForRequest:(NSURLRequest *)request response:(NSURLResponse *)response data:(NSData *)responseData{
    
    NSCachedURLResponse *cachedURLResponse = [[NSCachedURLResponse alloc] initWithResponse:response data:responseData];
    [[NSURLCache sharedURLCache] storeCachedResponse:cachedURLResponse forRequest:request];
}

/**
 *  根据 NSURLResponse 对象获取缓存策略
 */
- (NSURLCacheStoragePolicy)cacheStoragePolicyWithResponse:(NSURLResponse *)response{
    
    NSHTTPURLResponse *httpURLResponse = (NSHTTPURLResponse *)response;
    NSDictionary *headerFieldsDict = [httpURLResponse allHeaderFields];
    NSString *cache_control = [headerFieldsDict objectForKey:@"Cache-Control"];
    if([cache_control rangeOfString:@"no-cache"].location != NSNotFound&&[cache_control rangeOfString:@"no-store"].location != NSNotFound)
    {
        return NSURLCacheStorageNotAllowed;
    }
    else
    {
        return NSURLCacheStorageAllowed;
    }
    return  NSURLCacheStorageNotAllowed;
}

@end
