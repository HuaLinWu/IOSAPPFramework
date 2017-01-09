//
//  UIControl+ThrottleEvent.h
//  EventThrottle
//
//  Created by Steven on 17/1/9.
//  Copyright © 2017年 Steven. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (ThrottleEvent)
/*@method
 *@abstract 给UICotrol 添加一个事件节制的响应
 * throttleTimeInterval 如果上次点击事件和这次点击事件相隔不到throttleTimeInterval 后面的点击事件将会被忽略掉
 */
- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents throttleTimeInterval:(NSTimeInterval)timeInterval;
@end
