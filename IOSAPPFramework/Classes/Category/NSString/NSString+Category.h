//
//  NSString+Category.h
//  IOSAPPFramework
//
//  Created by 吴华林 on 16/5/31.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Category)
/**
 *  中英文的长度，按字节来算
 */
- (NSInteger)getValidLenth;
/**
 *  去掉字符串两边的空白格
 */
- (NSString *)trim;
/**
 *  创建一个唯一的UDID
 */
+ (NSString *)createUDID;
/**
 *  判断一个字符串是否全由字母组成
 */
- (BOOL)is_letters;
@end

//加密
@interface NSString (Encrypt)
/**
 *  md5 16位加密
 */
- (NSString *)md5_16;

/**
 *  md5 32位加密
 */
- (NSString *)md5_32;
/**
 *  URL 加密
 */
- (NSString *)urlEncoding;
/**
 *  URL解密
 */
- (NSString *)urlDecoding;
/**
 *  sha1 加密
 */
- (NSString*)sha1;
@end
@interface NSString (Date)
/**
 * 从日期生成yyyy-MM-dd格式的字符串
 **/
+ (NSString *)stringFromDate:(NSDate *)date;
/**
 * 从日期生成yyyy-MM-dd HH:mm格式的字符串
 **/
+ (NSString *)stringYMDHMFromDate:(NSDate *)date;
/**
 * 从日期生成yyyy-MM-dd HH:mm:ss格式的字符串
 **/
+ (NSString *)stringYMDHMSFromDate:(NSDate *)date;
/**
 * 从日期生成yyyy格式的字符串
 **/
+ (NSString *)stringYFromDate:(NSDate *)date;
@end