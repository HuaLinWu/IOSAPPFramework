//
//  textCell.m
//  IOSAPPFramework
//
//  Created by 吴华林 on 16/5/26.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import "textCell.h"
#import "viewControllerCellModel.h"
@interface textCell()
@property(nonatomic,strong)UITextField *txtField;
@end
@implementation textCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        self.txtField = [[UITextField alloc] initWithFrame:CGRectMake(self.frame.size.width-100, 0, 100, self.frame.size.height)];
        [self addSubview:self.txtField];
      
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.txtField.frame = CGRectMake(self.frame.size.width-100, 0, 100, self.frame.size.height);
}
- (void)setCellDataSource:(id<RootTableViewAdaptorItemBaseProtocol>)cellDataSource
{
    [super setCellDataSource:cellDataSource];
    viewControllerCellModel*model = (viewControllerCellModel *)cellDataSource;
    self.txtField.text = model.name;
    
}
@end
