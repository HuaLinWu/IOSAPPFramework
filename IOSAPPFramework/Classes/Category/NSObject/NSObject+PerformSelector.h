//
//  NSObject+PerformSelector.h
//  IOSAPPFramework
//  扩展书写方法调用
//  Created by Steven on 16/10/11.
//  Copyright © 2016年 吴华林(平安好房技术中心产品研发部IOS研发团队). All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (PerformSelector)
- (id)performSelector:(SEL)aSelector withMutableObject:(id)object,...;
@end
