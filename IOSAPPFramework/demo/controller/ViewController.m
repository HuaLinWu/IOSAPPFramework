//
//  ViewController.m
//  IOSAPPFramework
//
//  Created by 吴华林 on 16/5/19.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import "ViewController.h"
#import "viewControllerCellModel.h"
#import "textCell.h"
#import "RootAlertView.h"
#import "RootWebViewController.h"
#import "UIWebView+NSURLCache.h"
#import <objc/runtime.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    for(int i=0;i<200;i++)
    {
        viewControllerCellModel *model = [[viewControllerCellModel alloc] init];
        model.name = [NSString stringWithFormat:@"单元格%i",i];
        model.cellClass = [textCell class];
        model.cellHeight = 44;
        model.cellIdentifier =@"cell";
        model.cellStytle = RootTableViewCellStyleBottomLine|RootTableViewCellStyleTopLine;
       [[self.adaptor cellItemArrayForSection:0] addObject:model];
    }
    [self.tableView reloadData];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 100);
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"点我" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
   
}
- (void)buttonClick:(UIButton *)button
{
//    RootAlertView *alert = [[RootAlertView alloc] init];
//    alert.alertViewStyle =  RootAlertViewStyleDefault;
//    [alert show];
//    ViewController *nextVC = [[ViewController alloc] init];
//    [self.navigationController pushViewController:nextVC  hideBottomBar:YES animated:YES];
    RootWebViewController *nextVC = [[ RootWebViewController alloc] init];
    nextVC.urlStr = @"http://news.baidu.com";
    [self.navigationController pushViewController:nextVC hideBottomBar:YES animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
