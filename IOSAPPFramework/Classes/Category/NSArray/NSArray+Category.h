//
//  NSArray+Category.h
//  IOSAPPFramework
//
//  Created by 吴华林 on 16/5/30.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Category)
/**
 *  防止index 超过了数组元素总和导致的crash
 */
- (id)objectAtIndexEx:(NSUInteger)index;
@end

@interface NSArray (NSData)
/**
 *  将json 格式的data 类型转化成字典
 *  @param data json格式的data
 */
+ (NSArray *)arrayFromJSonData:(id)data;
/**
 *  将字典转化成json 的data
 *
 *  @return 返回一个json格式的data
 */
+ (NSData *)jsonDataFormArray:(id)array;
@end

@interface NSArray (NSString)
/**
 *  加json字符串转化成字典
 *
 *  @param str 待转化的字符串
 *
 *  @return 字典
 */
+ (NSArray *)arrayFromJsonStr:(id)str;
/**
 *  将字典转化成字符串
 *
 *  @param dict 待转化的字典
 *
 *  @return json字符串
 */
+ (NSString *)jsonStrFromArray:(id)array;
@end