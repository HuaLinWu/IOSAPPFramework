//
//  RootNavigationController.m
//  IOSAPPFramework
//
//  Created by 吴华林 on 16/6/2.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import "RootNavigationController.h"

@implementation RootNavigationController

- (void)pushViewController:(UIViewController *)viewController hideBottomBar:(BOOL)hideBottomBar animated:(BOOL)animated
{
    viewController.hidesBottomBarWhenPushed = hideBottomBar;
    [self pushViewController:viewController animated:animated];
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [super pushViewController:viewController animated:animated];
}
@end
