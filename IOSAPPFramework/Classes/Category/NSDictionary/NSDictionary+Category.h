//
//  NSDictionary+Category.h
//  IOSAPPFramework
//
//  Created by 吴华林 on 16/5/30.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Category)
/**
 *  防止akey 为空的时候导致的crash
 */
- (id)objectForKeyEx:(id)aKey;
@end
@interface NSDictionary (NSData)
/**
 *  将json 格式的data 类型转化成字典
 *
 *  @param data json格式的data
 *
 *  @return 转化后的字典
 */
+ (NSDictionary *)dictionaryFromJSonData:(id)data;
/**
 *  将字典转化成json 的data
 *
 *  @return 返回一个json格式的data
 */
+ (NSData *)jsonDataFormDictionary:(id)dict;
@end
@interface NSDictionary (NSString)
/**
 *  加json字符串转化成字典
 *
 *  @param str 待转化的字符串
 *
 *  @return 字典
 */
+ (NSDictionary *)dictionaryFromJsonStr:(id)str;
/**
 *  将字典转化成字符串
 *
 *  @param dict 待转化的字典
 *
 *  @return json字符串
 */
+ (NSString *)jsonStrFromDictionary:(id)dict;
@end