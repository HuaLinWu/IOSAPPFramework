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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
