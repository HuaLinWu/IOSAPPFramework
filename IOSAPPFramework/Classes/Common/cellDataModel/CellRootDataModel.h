//
//  cellDataModel.h
//  IOSAPPFramework
//
//  Created by 吴华林 on 16/5/26.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RootTableViewAdaptorItemBaseProtocol.h"
@interface CellRootDataModel :DataModel <RootTableViewAdaptorItemBaseProtocol>
/**
 *  单元格的类明
 */
@property(nonatomic,strong)Class cellClass;

/**
 *  单元格重用标示
 */
@property(nonatomic,copy)NSString *cellIdentifier;
/**
 *  单元格的高度
 */
@property(nonatomic,assign)CGFloat cellHeight;
/**
 *  单元格的样式
 */
@property(nonatomic)RootTableViewCellStytle cellStytle;
/**
 *  单元格下面的分隔线的颜色
 */
@property(nonatomic,strong)UIColor *bottomLineColor;
/**
 *  单元格下面的分隔线
 */
@property(nonatomic)UIEdgeInsets bottomLineEdgeInsets;

/**
 *  单元格上面的分隔线的颜色
 */
@property(nonatomic,strong)UIColor *topLineColor;
/**
 *  单元格上面的分隔线
 */
@property(nonatomic)UIEdgeInsets topLineEdgeInsets;
@end
