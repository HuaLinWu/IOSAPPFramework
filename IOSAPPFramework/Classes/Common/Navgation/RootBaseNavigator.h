//
//  RootBaseNavigator.h
//  IOSAPPFramework
//  所有的跳转的父类
//  Created by 吴华林 on 16/6/7.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface RootBaseNavigator : NSObject
/**
 *  当前视图所在的winodw
 */
@property(nonatomic,strong,readonly)UIWindow *keyWindow;
/**
 *  根视图
 */
@property(nonatomic,strong,readonly)UIViewController *rootViewController;
/*!
 @property
 @abstract      导航堆栈中最上面的viewcontroller
 */
@property (nonatomic, readonly) UIViewController  * topViewController;
/**
 *  当前的显示的视图
 */
@property(nonatomic,strong,readonly)UIViewController *visibleViewController;
/**
 *  当前堆栈的视图集合
 */
@property(nonatomic,strong) NSArray<__kindof UIViewController *> *viewControllers;

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;
@end
