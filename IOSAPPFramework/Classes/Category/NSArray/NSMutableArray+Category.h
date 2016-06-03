//
//  NSMutableArray+Category.h
//  IOSAPPFramework
//
//  Created by 吴华林 on 16/5/30.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Category)
/**
 *  防止index 超过数组的上限导致crash
 */
- (void)insertObjectEx:(id)anObject atIndex:(NSUInteger)index;
/**
 *  防止anObject 为空的时候crash
 */
- (void)addObjectEx:(id)anObject;
/**
 *  防止index 超过数组的上限导致crash
 */
- (void)removeObjectAtIndexEx:(NSUInteger)index;
/**
 *  防止anObject 为空的时候crash
 */
- (void)removeObjectEx:(id)anObject;
/**
 *  防止index 超过数组的上限导致crash，anObject 为空的时候
 */
- (void)replaceObjectAtIndexEx:(NSUInteger)index withObject:(id)anObject;
/**
 *  防止index 超过数组的上限导致crash
 */
- (void)addObjectsFromArrayEx:(NSArray *)otherArray;
/**
 *  防止index 超过数组的上限导致crash
 */
- (void)exchangeObjectAtIndexEx:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2;
@end
