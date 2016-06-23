//
//  UIView+Frame.h
//  IOSAPPFramework
//  便于设置view frame
//  Created by 吴华林(平安好房技术中心产品研发部IOS研发团队) on 16/6/23.
//  Copyright © 2016年 吴华林(平安好房技术中心产品研发部IOS研发团队). All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)
@property(nonatomic,assign)float width;
@property(nonatomic,assign)float height;
@property(nonatomic,assign)float x;
@property(nonatomic,assign)float y;
@property(nonatomic,assign)CGPoint origin;
@property(nonatomic,assign)CGSize size;
@end
