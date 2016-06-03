//
//  NSArray+Category.m
//  IOSAPPFramework
//
//  Created by 吴华林 on 16/5/30.
//  Copyright © 2016年 吴华林. All rights reserved.
//



@implementation NSArray (Category)
/**
 *  防止index 超过了数组元素总和导致的crash
 */
- (id)objectAtIndexEx:(NSUInteger)index
{
    if(index>=self.count)
    {
        return @"";
    }
    id value = [self objectAtIndex:index];
    if([NSObject isNil:value])
    {
        return @"";
    }
    return value;
}
@end

@implementation NSArray (NSData)
/**
 *  将json 格式的data 类型转化成字典
 *  @param data json格式的data
 */
+ (NSArray *)arrayFromJSonData:(id)data
{
    return [NSObject objectFromJsonData:data];
}
/**
 *  将字典转化成json 的data
 *
 *  @return 返回一个json格式的data
 */
+ (NSData *)jsonDataFormArray:(id)array
{
    return [NSObject jsonDataFromObject:array];
}
@end


@implementation NSArray (NSString)
/**
 *  加json字符串转化成字典
 *
 *  @param str 待转化的字符串
 *
 *  @return 字典
 */
+ (NSArray *)arrayFromJsonStr:(id)str
{
    if([NSObject isNil:str])
    {
        return nil;
    }
    NSData *jsonData = [str dataUsingEncoding:NSUTF8StringEncoding];
    return [NSArray arrayFromJSonData:jsonData];
}
/**
 *  将字典转化成字符串
 *
 *  @param dict 待转化的字典
 *
 *  @return json字符串
 */
+ (NSString *)jsonStrFromArray:(id)array
{
    if([NSObject isNil:array])
    {
        return nil;
    }
    NSData *jsonData = [NSArray jsonDataFromObject:array];
    NSString *jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonStr;
}
@end