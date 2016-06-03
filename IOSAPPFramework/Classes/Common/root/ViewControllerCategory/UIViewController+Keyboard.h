//
//  UIViewController+_Keyboard.h
//  IOSAPPFramework
//
//  Created by 吴华林 on 16/6/1.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"
@class RootViewController;
@interface RootViewController (Keyboard)
#pragma mark 键盘对应的监听事件
- (void)keyboardWillHide:(NSNotification *)notification;
- (void)keyboardWillShow:(NSNotification *)notification;
@end
