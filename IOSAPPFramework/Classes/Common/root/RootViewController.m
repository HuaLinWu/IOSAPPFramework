//
//  RootViewController.m
//  IOSAPPFramework
//
//  Created by 吴华林 on 16/5/25.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import "RootViewController.h"
#import "UIViewController+Keyboard.h"
@interface RootViewController()
@property(nonatomic,strong)RootNavigationController *navigationController;
@end
@implementation RootViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapEvent:)];
    [self.view addGestureRecognizer:tapGestureRecognizer];
    //初始化导航栏
    [self initNavigationBar];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //guang
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    //移除键盘的通知
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}
#pragma mark  初始化导航栏
- (void)initNavigationBar
{
    UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] init];
    backBarButtonItem.title=@"返回";
    self.navigationItem.backBarButtonItem = backBarButtonItem;
}

#pragma mark tapEvent
- (void)tapEvent:(UITapGestureRecognizer *)tapGestureRecognizer
{
    [self.view endEditing:YES];
}
#pragma mark set/get
- (RootNavigationController *)navigationController
{
  return (RootNavigationController *)[super navigationController];
}

@end
