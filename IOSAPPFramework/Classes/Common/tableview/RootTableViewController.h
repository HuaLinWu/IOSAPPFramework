//
//  RootTableViewController.h
//  IOSAPPFramework
//
//  Created by 吴华林 on 16/5/25.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import "RootViewController.h"
#import "RootPlainTableViewAdaptor.h"
@interface RootTableViewController : RootViewController<RootPlainTableViewAdaptorDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)RootPlainTableViewAdaptor *adaptor;
@end
