//
//  UIControl+ThrottleEvent.m
//  EventThrottle
//
//  Created by Steven on 17/1/9.
//  Copyright © 2017年 Steven. All rights reserved.
//

#import "UIControl+ThrottleEvent.h"
#import <objc/runtime.h>

@implementation UIControl (ThrottleEvent)
- (void)addTarget:(nullable id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents throttleTimeInterval:(NSTimeInterval)timeInterval{
     const char *key = [@"_throttleTimeInterval" UTF8String];
    objc_setAssociatedObject(self, key, [NSNumber numberWithDouble:timeInterval], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self addTarget:target action:action forControlEvents:controlEvents];
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class currentClass = [self class];
        Method swizzeMethod = class_getInstanceMethod(currentClass, @selector(sendThrottleAction:to:forEvent:));
        Method method = class_getInstanceMethod(currentClass, @selector(sendAction:to:forEvent:));
        BOOL success = class_addMethod(currentClass,method_getName(method), method_getImplementation(swizzeMethod), method_getTypeEncoding(swizzeMethod));
        if(success){
            class_replaceMethod(currentClass, method_getName(swizzeMethod), method_getImplementation(method), method_getTypeEncoding(method));
        }else {
            method_exchangeImplementations(method, swizzeMethod);
        }
    });
}
- (void)sendThrottleAction:(SEL)action to:(nullable id)target forEvent:(nullable UIEvent *)event{
        const char *key = [@"_lastRespondTime" UTF8String];
        const char *throttleTimeIntervalKey = [@"_throttleTimeInterval" UTF8String];
    NSTimeInterval throttleTimeInterval = [(NSNumber *)objc_getAssociatedObject(self, throttleTimeIntervalKey) doubleValue];
        NSTimeInterval lastRespondTime = [(NSNumber *)objc_getAssociatedObject(self, key) doubleValue];
        NSTimeInterval nowTimeInterVal = [[NSDate date] timeIntervalSince1970];
    if(nowTimeInterVal-lastRespondTime>throttleTimeInterval){
       objc_setAssociatedObject(self, key , [NSNumber numberWithDouble:nowTimeInterVal], OBJC_ASSOCIATION_RETAIN_NONATOMIC) ;
        [self sendThrottleAction:action to:target forEvent:event];
    }
}
@end
