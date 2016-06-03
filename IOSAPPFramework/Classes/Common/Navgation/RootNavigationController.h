//
//  RootNavigationController.h
//  IOSAPPFramework
//
//  Created by 吴华林 on 16/6/2.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootNavigationController : UINavigationController
/**
 *  push方法
 */
- (void)pushViewController:(UIViewController *)viewController hideBottomBar:(BOOL)hideBottomBar animated:(BOOL)animated;
@end
