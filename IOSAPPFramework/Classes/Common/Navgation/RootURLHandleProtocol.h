//
//  RootURLHandleProtocol.h
//  IOSAPPFramework
//  URL 处理的的协议（本系统中可能会遇到1.跳转原生页面的2.跳转html5的 2.1 在应用内部进行显示html 5 3.其他类型的url，例如打电话的功能的url，我准备采用责任链模式进行实现相应的操作）
//  Created by 吴华林(平安好房技术中心产品研发部IOS研发团队) on 16/6/7.
//  Copyright © 2016年 吴华林(平安好房技术中心产品研发部IOS研发团队). All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RootURLHandleProtocol <NSObject>
@optional
/**
 *  责任中下一个节点
 */
@property (nonatomic,strong)id <RootURLHandleProtocol>nextURLHandle;

- (BOOL)openURL:(NSString *)url;
@end
