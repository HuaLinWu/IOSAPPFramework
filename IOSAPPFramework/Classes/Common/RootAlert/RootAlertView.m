//
//  RootAlertViewController.m
//  IOSAPPFramework
//
//  Created by 吴华林 on 16/6/1.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import "RootAlertView.h"
@interface RootAlertView ()
@property(nonatomic,strong) UIView *backView;
@property(nonatomic,assign) BOOL    backViewIsVisible;
@end
@implementation RootAlertView

#pragma mark 显示的alert
- (void)show
{
    [self showWithAlertStyle:RootAlertViewStyleDefault];
}
- (void)showWithAlertStyle:(RootAlertViewStyle)alertViewStyle
{
    if(!self.backViewIsVisible)
    {
        if(self.alertViewStyle == RootAlertViewStyleCustom)
        {
            self.backView.backgroundColor = [UIColor clearColor];
        }
        [self showBackView];
        UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
        [keyWindow addSubview:self];
    }
}
- (void)showBackView;
{
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    self.backView.frame = keyWindow.bounds;
    [keyWindow addSubview:self.backView];
}
- (void)tapEvent:(UITapGestureRecognizer *)tapGestureRecognizer
{
    [self removeFromSuperview];
}
- (void)removeFromSuperview
{
    [super removeFromSuperview];
     self.backViewIsVisible = NO;
    [self.backView removeFromSuperview];
}
#pragma mark set/get
- (UIView *)backView
{
    if(!_backView)
    {
        _backView = [[UIView alloc] init];
        _backView.backgroundColor = [UIColor blackColor];
        _backView.alpha = 0.5;
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapEvent:)];
        [_backView addGestureRecognizer:tapGestureRecognizer];
    }
    return _backView;
}
@end
