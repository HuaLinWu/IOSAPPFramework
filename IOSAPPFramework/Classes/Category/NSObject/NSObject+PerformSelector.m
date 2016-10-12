//
//  NSObject+PerformSelector.m
//  IOSAPPFramework
//
//  Created by Steven on 16/10/11.
//  Copyright © 2016年 吴华林(平安好房技术中心产品研发部IOS研发团队). All rights reserved.
//

#import "NSObject+PerformSelector.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import <assert.h>
@implementation NSObject (PerformSelector)

/**
 *  N个参数调用
 *
 *  @param aSelector 方法名
 *  @param object    第一个参数
 *
 *  @return 调用了多个参数
 */
- (id)performSelector:(SEL)aSelector withMutableObject:(id)object,...{
    if(!aSelector){
        return nil;
    }
    va_list ap;
    id eachObject;
    Method method = class_getInstanceMethod([self class], aSelector);
    unsigned int argumentsNumber = method_getNumberOfArguments(method)-2;
    NSMethodSignature *methodSign = [self methodSignatureForSelector:aSelector];
    assert(methodSign!=nil);
    
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSign];
    invocation.target = self;
    invocation.selector = aSelector = aSelector;
        argumentsNumber--;
    va_start(ap, object);
    [invocation setArgument:&object atIndex:2];
    for(int i = 3;i<3+argumentsNumber;i++){
         eachObject = va_arg(ap, id);
        [invocation setArgument:&eachObject atIndex:i];
    }
    va_end(ap);
    [invocation invoke];
    id returnValue = nil;
    if(methodSign.methodReturnLength!=0){
        [invocation getReturnValue:&returnValue];
    }
    
    return returnValue;
}
@end
