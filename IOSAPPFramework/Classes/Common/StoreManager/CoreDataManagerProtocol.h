//
//  CoreDataManagerProtocol.h
//  IOSAPPFramework
//
//  Created by 吴华林 on 16/7/7.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CoreDataManagerProtocol <NSObject>
// 将model 插入对应的coredata entity
- (void)addModel:(DataModel *)model;
- (void)deleteModel:(DataModel *)model;

@end
