//
//  RootTableViewController.m
//  IOSAPPFramework
//
//  Created by 吴华林 on 16/5/25.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import "RootTableViewController.h"
@implementation RootTableViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource   = self.adaptor;
    self.tableView.delegate     = self.adaptor;
    self.tableView.scrollsToTop  = YES;
    self.adaptor.tableView = self.tableView;
    self.adaptor.delegate = self;
}
#pragma mark set,get
- (UITableView *)tableView
{
    if(!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}
- (RootPlainTableViewAdaptor *)adaptor
{
    if(!_adaptor)
    {
        _adaptor = [[RootPlainTableViewAdaptor alloc] init];
    }
    return _adaptor;
}
@end
