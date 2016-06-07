//
//  NavigationWebURLHandle.h
//  IOSAPPFramework
//  跳转本地webviewController的视图
//  Created by 吴华林(平安好房技术中心产品研发部IOS研发团队) on 16/6/7.
//  Copyright © 2016年 吴华林(平安好房技术中心产品研发部IOS研发团队). All rights reserved.
//

#import "RootURLHandleProtocol.h"

@interface NavigationWebURLHandle :  NSObject <RootURLHandleProtocol>
@property (nonatomic,strong)id <RootURLHandleProtocol>nextURLHandle;
- (BOOL)openURL:(NSString *)url;
@end
