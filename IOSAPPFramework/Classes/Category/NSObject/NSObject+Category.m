//
//  NSObject+Category.m
//  IOSAPPFramework
//
//  Created by 吴华林 on 16/5/30.
//  Copyright © 2016年 吴华林. All rights reserved.
//



@implementation NSObject (Category)
/**
 *  判读对象是否是nil
 *
 *  @param object 待验证的对象
 *
 *  @return 如果是空就返回yes 否则返回NO
 */
+ (BOOL)isNil:(id)anObject
{
    
    if(!anObject||anObject==nil||anObject==NULL||[anObject isEqual:@"<null>"]||[anObject isKindOfClass:[NSNull class]]||[anObject isEqual:@"null"])
    {
        return YES;
    }
    return NO;
}
@end
@implementation NSObject (NSData)
/**
 *  将对像转化成城json data
 *
 *  @param anObject 待转化的对象
 *
 *  @return 返回一个json格式的data
 */
+ (NSData *)jsonDataFromObject:(id)anObject
{
    NSData *jsonData = nil;
    if([NSObject isNil:anObject])
    {
        return jsonData;
    }
   BOOL isValidJSonObject = [NSJSONSerialization isValidJSONObject:anObject];
   if(isValidJSonObject)
   {
       jsonData = [NSJSONSerialization dataWithJSONObject:anObject options:NSJSONReadingAllowFragments|NSJSONReadingMutableLeaves|NSJSONReadingMutableContainers error:nil];
   }
    return jsonData;
}
/**
 *  将jsonData 转化成对象
 *
 *  @param data json的data
 *
 *  @return 一个转化过后的object
 */
+ (id)objectFromJsonData:(id)data
{
    id object = nil;
    if([NSObject isNil:data])
    {
        return object;
    }
    object =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments|NSJSONReadingMutableLeaves|NSJSONReadingMutableContainers error:nil];
    return object;
}
@end