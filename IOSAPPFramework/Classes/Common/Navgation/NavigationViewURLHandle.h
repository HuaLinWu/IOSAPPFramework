//
//  NavigationViewURLHandle.h
//  IOSAPPFramework
//  跳转应用里面的页面的url 处理类
//  Created by 吴华林(平安好房技术中心产品研发部IOS研发团队) on 16/6/7.
//  Copyright © 2016年 吴华林(平安好房技术中心产品研发部IOS研发团队). All rights reserved.
//

#import "RootURLHandleProtocol.h"

@interface NavigationViewURLHandle : NSObject <RootURLHandleProtocol>
@property (nonatomic,strong)id <RootURLHandleProtocol>nextURLHandle;

- (BOOL)openURL:(NSString *)url;
@end
