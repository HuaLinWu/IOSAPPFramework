//
//  NSDictionary+Category.m
//  IOSAPPFramework
//
//  Created by 吴华林 on 16/5/30.
//  Copyright © 2016年 吴华林. All rights reserved.
//



@implementation NSDictionary (Category)
/**
 *  防止akey 为空的时候导致的crash
 */
- (id)objectForKeyEx:(id)aKey
{
    if([NSObject isNil:aKey])
    {
        return @"";
    }
    return [self objectForKey:aKey];
}
@end
@implementation NSDictionary (NSData)
/**
 *  将json 格式的data 类型转化成字典
 *  @param data json格式的data
 *  @return 转化后的字典
 */
+ (NSDictionary *)dictionaryFromJSonData:(id)data
{
    NSDictionary *jsonDict = [NSObject objectFromJsonData:data];
    return jsonDict;
}
/**
 *  将字典转化成json 的data
 *  @return 返回一个json格式的data
 */
+ (NSData *)jsonDataFormDictionary:(id)dict
{
    return [NSObject jsonDataFromObject:dict];
}
@end
@implementation NSDictionary (NSString)
/**
 *  加json字符串转化成字典
 *
 *  @param str 待转化的字符串
 *
 *  @return 字典
 */
+ (NSDictionary *)dictionaryFromJsonStr:(id)str
{
    if([NSObject isNil:str])
    {
        return nil;
    }
    NSData *jsonData = [str dataUsingEncoding:NSUTF8StringEncoding];
    return [NSDictionary dictionaryFromJSonData:jsonData];
}
/**
 *  将字典转化成字符串
 *
 *  @param dict 待转化的字典
 *
 *  @return json字符串
 */
+ (NSString *)jsonStrFromDictionary:(id)dict
{
    if([NSObject isNil:dict])
    {
        return nil;
    }
    NSData *jsonData = [NSDictionary jsonDataFormDictionary:dict];
    NSString *jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonStr;
}
@end