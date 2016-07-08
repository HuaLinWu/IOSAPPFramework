//
//  PersistenceManager.h
//  IOSAPPFramework
//
//  Created by 吴华林 on 16/7/7.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersistenceManager : NSObject
@property(nonatomic,strong)NSManagedObjectContext *context;
@property(nonatomic,strong)NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property(nonatomic,strong)NSManagedObjectModel *managedObjectModel;
@end
