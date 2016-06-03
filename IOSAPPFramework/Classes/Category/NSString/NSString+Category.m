//
//  NSString+Category.m
//  IOSAPPFramework
//
//  Created by 吴华林 on 16/5/31.
//  Copyright © 2016年 吴华林. All rights reserved.
//


#import "NSDateFormatter+Category.h"
#import <CommonCrypto/CommonCrypto.h>
@implementation NSString (Category)
/**
 *  中英文的长度，按字节来算
 */
- (NSInteger)getValidLenth
{
    if(self.trim.length==0)
    {
        return 0;
    }
   NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
   NSData *data = [self dataUsingEncoding:enc];
   return [data length];
}
/**
 *  去掉字符串两边的空白格
 */
- (NSString *)trim
{
   return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}
/**
 *  创建一个唯一的UDID
 */
+ (NSString *)createUDID
{
   CFUUIDRef udid = CFUUIDCreate(nil);
   NSString *strUDID = (__bridge_transfer NSString *)CFUUIDCreateString(nil, udid);
   CFRelease(udid);
   return strUDID;
}
/**
 *  判断一个字符串是否全由字母组成
 */
- (BOOL)is_letters
{
    NSString *regPattern = @"[a-zA-Z]+";
    NSPredicate *testResult = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regPattern];
    return [testResult evaluateWithObject:self];
}
@end
@implementation NSString (Encrypt)
/**
 *  md5 16位加密
 */
- (NSString *)md5_16
{
    NSString *md5Str = [self md5_32];
    if([NSObject isNil:md5Str])
    {
        return nil;
    }
    return [md5Str substringWithRange:NSMakeRange(8, 16)];
}

/**
 *  md5 32位加密
 */
- (NSString *)md5_32
{
    if(self == nil || [self length] == 0){
        return nil;
    }
    const char *src = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(src, (CC_LONG)strlen(src), result);
    return [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11], result[12], result[13], result[14], result[15]
            ];
}
/**
 *  NSURL 加密
 */
- (NSString *)urlEncoding
{
    if(self.length==0)
    {
        return @"";
    }
    NSString *result = (__bridge_transfer  NSString *)CFURLCreateStringByAddingPercentEscapes(NULL,(__bridge CFStringRef)self,NULL,(CFStringRef)@"!#[]'*;/?:@&=$+{}<>,",kCFStringEncodingUTF8);
    return result;
}
/**
 *  URL解密
 */
- (NSString *)urlDecoding
{
    NSString* result = [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return result;
}
/**
 *  sha1 加密
 */
- (NSString*)sha1
{
    const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:self.length];
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, (CC_LONG )data.length, digest);
    
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    return output;
}
@end
@implementation NSString (Date)
/**
 * 从日期生成yyyy-MM-dd格式的字符串
 **/
+ (NSString *)stringFromDate:(NSDate *)date {
    NSDateFormatter *formatter = [NSDateFormatter staticDateFormatter];
    
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *retStr = [formatter stringFromDate:date];
    
    return retStr;
}
/**
 * 从日期生成yyyy-MM-dd HH:mm格式的字符串
 **/
+ (NSString *)stringYMDHMFromDate:(NSDate *)date
{
    NSDateFormatter *formatter = [NSDateFormatter staticDateFormatter];
    
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *retStr = [formatter stringFromDate:date];
    return retStr;
}
/**
 * 从日期生成yyyy-MM-dd HH:mm:ss格式的字符串
 **/
+ (NSString *)stringYMDHMSFromDate:(NSDate *)date
{
    NSDateFormatter *formatter = [NSDateFormatter staticDateFormatter];
    
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *retStr = [formatter stringFromDate:date];
    
    return retStr;
}
/**
 * 从日期生成yyyy格式的字符串
 **/
+ (NSString *)stringYFromDate:(NSDate *)date
{
    NSDateFormatter *formatter = [NSDateFormatter staticDateFormatter];
    
    [formatter setDateFormat:@"yyyy"];
    NSString *retStr = [formatter stringFromDate:date];
    
    return retStr;
}
@end