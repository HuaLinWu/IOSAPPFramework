//
//  URLRouter.h
//  IOSAPPFramework
//  url 路由器功能
//  Created by 吴华林(平安好房技术中心产品研发部IOS研发团队) on 16/8/15.
//  Copyright © 2016年 吴华林(平安好房技术中心产品研发部IOS研发团队). All rights reserved.
//

#import <Foundation/Foundation.h>

@interface URLRouter : NSObject
/**
 *  打开对应的url
 *  @param url 字符串
 */
+ (void)openURL:(NSString *)url;
@end
