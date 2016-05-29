//
//  RootTableViewAdaptorItemBaseProtocol.h
//  IOSAPPFramework
// 这是单元格item必须许遵循的协议
//  Created by 吴华林 on 16/5/25.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,RootTableViewCellStytle)
{
    RootTableViewCellStyleDefault    = 1,//表示没有上面的分隔线，也没有下面的分隔线
    RootTableViewCellStyleBottomLine = 2,//表示有下分割线
    RootTableViewCellStyleTopLine    = 4//表示有上面的分割线
};
@protocol RootTableViewAdaptorItemBaseProtocol <NSObject>
@optional
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
@property(nonatomic,assign)RootTableViewCellStytle cellStytle;
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
