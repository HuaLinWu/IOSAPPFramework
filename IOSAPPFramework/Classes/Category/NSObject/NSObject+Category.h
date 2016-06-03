//
//  NSObject+Category.h
//  IOSAPPFramework
//
//  Created by 吴华林 on 16/5/30.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Category)
/**
 *  判读对象是否是nil
 *
 *  @param object 待验证的对象
 *
 *  @return 如果是空就返回yes 否则返回NO
 */
+ (BOOL)isNil:(id)anObject;
@end
@interface NSObject (NSData)
/**
 *  将对像转化成城json data
 *
 *  @param anObject 待转化的对象
 *
 *  @return 返回一个json格式的data
 */
+ (NSData *)jsonDataFromObject:(id)anObject;
/**
 *  将jsonData 转化成对象
 *
 *  @param data json的data
 *
 *  @return 一个转化过后的object
 */
+ (id)objectFromJsonData:(id)data;
@end