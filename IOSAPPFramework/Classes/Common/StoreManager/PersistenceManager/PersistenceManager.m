//
//  PersistenceManager.m
//  IOSAPPFramework
//
//  Created by 吴华林 on 16/7/7.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import "PersistenceManager.h"
#import <CoreData/CoreData.h>
@implementation PersistenceManager
#pragma mark get/set
- (NSManagedObjectModel *)managedObjectModel
{
    if(!_managedObjectModel)
    {
        _managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
        
    }
    return _managedObjectModel;
}
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if(!_persistentStoreCoordinator)
    {
        _persistentStoreCoordinator = [[NSPersistentStoreCoordinator  alloc] initWithManagedObjectModel:self.managedObjectModel];
    }
    return _persistentStoreCoordinator;
}
- (NSManagedObjectContext *)context
{
    if(!_context)
    {
        _context = [[NSManagedObjectContext alloc] init];
        _context.persistentStoreCoordinator = self.persistentStoreCoordinator;
    }
    return _context;
}
@end
