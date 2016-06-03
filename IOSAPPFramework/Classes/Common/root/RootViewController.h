//
//  RootViewController.h
//  IOSAPPFramework
//
//  Created by 吴华林 on 16/5/25.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootNavigationController.h"
@interface RootViewController : UIViewController
@property(nonatomic,strong,readonly)RootNavigationController *navigationController;
@end
