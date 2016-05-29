//
//  cellDataModel.m
//  IOSAPPFramework
//
//  Created by 吴华林 on 16/5/26.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import "CellRootDataModel.h"

@implementation CellRootDataModel
- (UIColor *)bottomLineColor
{
    if(!_bottomLineColor)
    {
        _bottomLineColor = [UIColor lightGrayColor];
    }
    return _bottomLineColor;
}
- (UIColor *)topLineColor
{
    if(!_topLineColor)
    {
        _topLineColor = [UIColor lightGrayColor];
    }
    return _topLineColor;
}
@end
