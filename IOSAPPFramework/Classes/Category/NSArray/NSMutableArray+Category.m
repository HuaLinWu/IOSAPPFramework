//
//  NSMutableArray+Category.m
//  IOSAPPFramework
//
//  Created by 吴华林 on 16/5/30.
//  Copyright © 2016年 吴华林. All rights reserved.
//



@implementation NSMutableArray (Category)
/**
 *  防止index 超过数组的上限导致crash
 */
- (void)insertObjectEx:(id)anObject atIndex:(NSUInteger)index
{
    if([NSObject isNil:anObject]||index>=self.count)
    {
        return;
    }
    [self insertObject:anObject atIndex:index];
    
}
/**
 *  防止anObject 为空的时候crash
 */
- (void)addObjectEx:(id)anObject
{
    if([NSObject isNil:anObject])
    {
        return;
    }
    [self addObject:anObject];
}
/**
 *  防止anObject 为空的时候crash
 */
- (void)removeObjectEx:(id)anObject
{
    if([NSObject isNil:anObject])
    {
        return;
    }
    [self removeObject:anObject];
}
/**
 *  防止index 超过数组的上限导致crash
 */
- (void)removeObjectAtIndexEx:(NSUInteger)index
{
    if(index>=self.count)
    {
        return;
    }
    [self removeObjectAtIndex:index];

}
/**
 *  防止index 超过数组的上限导致crash，anObject 为空的时候
 */
- (void)replaceObjectAtIndexEx:(NSUInteger)index withObject:(id)anObject
{
    if(index>=self.count||[NSObject isNil:anObject])
    {
        return;
    }
    [self replaceObjectAtIndexEx:index withObject:anObject];
}
/**
 *  防止index 超过数组的上限导致crash
 */
- (void)addObjectsFromArrayEx:(NSArray *)otherArray
{
    if([NSObject isNil:otherArray])
    {
        return ;
    }
    [self addObjectsFromArray:otherArray];
}
/**
 *  防止index 超过数组的上限导致crash
 */
- (void)exchangeObjectAtIndexEx:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2
{
    if(idx1>=self.count||idx2>=self.count)
    {
        return;
    }
    [self exchangeObjectAtIndex:idx1 withObjectAtIndex:idx2];
}
@end
