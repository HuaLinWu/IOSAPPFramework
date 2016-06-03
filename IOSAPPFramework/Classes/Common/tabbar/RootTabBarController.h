//
//  RootTabBarController.h
//  IOSAPPFramework
//
//  Created by 吴华林 on 16/6/2.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootTabBarButton : NSObject
//标题
@property(nonatomic,copy)NSString *title;
//未选中状态下的图片
@property(nonatomic,strong)UIImage *image;
//选中状态下的图片
@property(nonatomic,strong)UIImage *selectedImage;
//字体未选中状态下的颜色
@property(nonatomic,strong)UIColor *textColor;
//字体选中状态下的颜色
@property(nonatomic,strong)UIColor *textSelectedColor;

//这个按钮对应的视图控制器
@property(nonatomic,strong)UIViewController *viewController;

- (instancetype)initWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage textColor:(UIColor *)textColor textSelectedColor:(UIColor *)textSelectedColor viewController:(UIViewController *)viewController;

@end

@interface RootTabBarController : UITabBarController
- (instancetype)initWitTabBarButton:(NSArray<RootTabBarButton *> *)tabBarButtons;
- (void)addTabBarButton:(RootTabBarButton *)tabBarButton;
@end
