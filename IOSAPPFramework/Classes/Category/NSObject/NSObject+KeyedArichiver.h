//
//  NSObject+KeyedArichiver.h
//  KeyedArichiverLibrary
//  归档分类
//  Created by Steven on 16/9/12.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (KeyedArichiver)
/**
 *  个归档的对象设置一个文件名，不要需要带后缀
 *
 *  @param name 文件名
 */
- (void)encodeWithName:(NSString *)name;
/**
 *  从文件名，不需要带后缀解档的对象出来
 *
 *  @param name 待解档的文件名
 *
 *  @return 返回对应的对象
 */
+ (instancetype)decodeWithName:(NSString *)name;
@end
