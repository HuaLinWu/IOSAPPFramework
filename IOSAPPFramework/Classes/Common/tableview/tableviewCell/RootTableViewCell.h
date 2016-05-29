//
//  RootTableViewCell.h
//  IOSAPPFramework
//
//  Created by 吴华林 on 16/5/26.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootTableViewAdaptorItemBaseProtocol.h"
@interface RootTableViewCell : UITableViewCell
@property(nonatomic,strong)id<RootTableViewAdaptorItemBaseProtocol>cellDataSource;
+ (CGFloat)tableView:(UITableView*)tableView rowHeightForObject:(id<RootTableViewAdaptorItemBaseProtocol>)object;
@end
