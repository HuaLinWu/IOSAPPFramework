//
//  RootTableViewCell.m
//  IOSAPPFramework
//
//  Created by 吴华林 on 16/5/26.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import "RootTableViewCell.h"
#import <objc/runtime.h>
@interface RootTableViewCell()
@property(nonatomic,strong)UILabel *bottomLineLabel;
@property(nonatomic,strong)UILabel *topLineLabel;
@end
@implementation RootTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
         [self.contentView addSubview:self.bottomLineLabel];
         [self.contentView addSubview:self.topLineLabel];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
     self.bottomLineLabel.frame = CGRectMake(0+self.cellDataSource.bottomLineEdgeInsets.left, self.frame.size.height-0.5+self.cellDataSource.bottomLineEdgeInsets.top-self.cellDataSource.bottomLineEdgeInsets.bottom, self.frame.size.width-self.cellDataSource.bottomLineEdgeInsets.left-self.cellDataSource.bottomLineEdgeInsets.right, 0.5);
    self.bottomLineLabel.backgroundColor = self.cellDataSource.bottomLineColor;
    
    self.topLineLabel.frame = CGRectMake(0+self.cellDataSource.topLineEdgeInsets.left, 0+self.cellDataSource.topLineEdgeInsets.top-self.cellDataSource.topLineEdgeInsets.bottom, self.frame.size.width-self.cellDataSource.topLineEdgeInsets.left-self.cellDataSource.topLineEdgeInsets.right, 0.5);
    self.topLineLabel.backgroundColor = self.cellDataSource.topLineColor;
    if(self.cellDataSource.cellStytle == (RootTableViewCellStyleTopLine|RootTableViewCellStyleBottomLine))
    {
        self.topLineLabel.hidden = NO;
        self.bottomLineLabel.hidden = NO;
    }
    if (self.cellDataSource.cellStytle == (RootTableViewCellStyleTopLine|RootTableViewCellStyleDefault))
    {
        self.topLineLabel.hidden = NO;
        self.bottomLineLabel.hidden = YES;
    }
    if (self.cellDataSource.cellStytle == (RootTableViewCellStyleBottomLine|RootTableViewCellStyleDefault))
    {
        self.topLineLabel.hidden = YES;
        self.bottomLineLabel.hidden = NO;
    }
}

#pragma mark public
+ (CGFloat)tableView:(UITableView*)tableView rowHeightForObject:(id<RootTableViewAdaptorItemBaseProtocol>)object
{
    if(object.cellHeight)
    {
        return object.cellHeight;
    }
    return 44;
}
#pragma mark set/get
- (void)setCellDataSource:(id<RootTableViewAdaptorItemBaseProtocol>)cellDataSource
{
    _cellDataSource = cellDataSource;
}
- (UILabel *)bottomLineLabel
{
    if(!_bottomLineLabel)
    {
        _bottomLineLabel = [[UILabel alloc] init];
        _bottomLineLabel.backgroundColor = [UIColor lightGrayColor];
        _bottomLineLabel.hidden = YES;
    }
    return _bottomLineLabel;
}
- (UILabel *)topLineLabel
{
    if(!_topLineLabel)
    {
        _topLineLabel = [[UILabel alloc] init];
        _topLineLabel.backgroundColor = [UIColor lightGrayColor];
        _topLineLabel.hidden = NO;
    }
    return _topLineLabel;
}

@end
