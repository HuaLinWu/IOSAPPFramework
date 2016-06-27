//
//  UIWebView+NSURLCache.h
//  IOSAPPFramework
//  带缓存的webview
//  Created by 吴华林(平安好房技术中心产品研发部IOS研发团队) on 16/6/23.
//  Copyright © 2016年 吴华林(平安好房技术中心产品研发部IOS研发团队). All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,UIWebViewCachePolicy)
{
    // 默认的缓存策略， 如果缓存不存在，直接从服务端获取。如果缓存存在，会根据response中的Cache-Control字段判断下一步操作，如: Cache-Control字段为must-revalidata, 则询问服务端该数据是否有更新，无更新的话直接返回给用户缓存数据，若已更新，则请求服务端.
     UIWebViewUseProtocolCachePolicy,
    //忽略本地缓存数据，直接请求服务端.
     UIWebViewReloadIgnoringLocalCacheData,
    //有缓存就使用，不管其有效性(即忽略Cache-Control字段), 无则请求服务端.
     UIWebViewReturnCacheDataElseLoad,
    // 死活加载本地缓存. 没有就失败. (确定当前无网络时使用)
    UIWebViewReturnCacheDataDontLoad
    
};

@interface UIWebViewCahe:UIWebView
@property UIWebViewCachePolicy cachePolicy;
@property (nonatomic,assign)NSInteger memoryCapacity;
@property (nonatomic,assign)NSInteger diskCapacity;
@property (nonatomic,copy)  NSString    *diskPath;
@property (nonatomic,assign)id <UIWebViewDelegate>cacheDelegate;
- (instancetype)initWithMemoryCapacity:(NSUInteger)memoryCapacity diskCapacity:(NSUInteger)diskCapacity diskPath:(NSString *)path cachePolicy:(UIWebViewCachePolicy)cachePolicy;
@end


