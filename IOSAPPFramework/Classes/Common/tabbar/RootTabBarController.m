//
//  RootTabBarController.m
//  IOSAPPFramework
//
//  Created by 吴华林 on 16/6/2.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import "RootTabBarController.h"

@implementation RootTabBarButton

- (instancetype)initWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage textColor:(UIColor *)textColor textSelectedColor:(UIColor *)textSelectedColor viewController:(UIViewController *)viewController
{
    self = [super init];
    if(self)
    {
        self.title = title;
        self.image = image;
        self.selectedImage = selectedImage;
        self.viewController = viewController;
        self.textColor = textColor;
        self.textSelectedColor = textSelectedColor;
    }
    return self;
}
@end

@interface RootTabBarController()
@property(nonatomic,strong)NSMutableArray *rootViewControllers;
@end
@implementation RootTabBarController
- (instancetype)initWitTabBarButton:(NSArray<RootTabBarButton *> *)tabBarButtons
{
    self =[super init];
    if(self)
    {
        if([tabBarButtons isKindOfClass:[NSArray class]])
        {
            for(int i=0;i<tabBarButtons.count;i++)
            {
                RootTabBarButton *tabBarButton = tabBarButtons[i];
                [self addTabBarButton:tabBarButton];
            }
        }
        self.tabBar.barTintColor = [UIColor whiteColor];
    }
    return self;
}
- (void)addTabBarButton:(RootTabBarButton *)tabBarButton
{
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:tabBarButton.title image:tabBarButton.image selectedImage:tabBarButton.selectedImage];
    if(tabBarButton.textColor)
    {
        [tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:tabBarButton.textColor} forState:UIControlStateNormal];
    }
    if(tabBarButton.textSelectedColor)
    {
        [tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:tabBarButton.textSelectedColor} forState:UIControlStateSelected ];

    }
    tabBarButton.viewController.tabBarItem = tabBarItem;
    [self.rootViewControllers addObject:tabBarButton.viewController];
    [self setViewControllers:self.rootViewControllers animated:YES];
}

#pragma mark set,get
- (NSMutableArray *)rootViewControllers
{
    if(!_rootViewControllers)
    {
        _rootViewControllers = [[NSMutableArray alloc] init];
    }
    return _rootViewControllers;
}

@end
