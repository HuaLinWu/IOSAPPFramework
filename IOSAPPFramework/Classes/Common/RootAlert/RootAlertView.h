//
//  RootAlertViewController.h
//  IOSAPPFramework
//
//  Created by 吴华林 on 16/6/1.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootAlertProtocol.h"

@interface RootAlertView : UIView <RootAlertProtocol>
@property(nonatomic)RootAlertViewStyle alertViewStyle;
@end
