//
//  RootAlertProtocol.h
//  IOSAPPFramework
//
//  Created by 吴华林 on 16/6/2.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, RootAlertViewStyle)
{
    RootAlertViewStyleDefault,//默认背景是黑色的
    RootAlertViewStyleCustom  //默认背景是透明的
};
@protocol RootAlertProtocol <NSObject>
@optional
@property(nonatomic)RootAlertViewStyle alertViewStyle;
- (void)show;
@end
