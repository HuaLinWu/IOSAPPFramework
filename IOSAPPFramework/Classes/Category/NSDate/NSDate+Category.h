//
//  NSDate+Category.h
//  haofang
//
//  Created by Aim on 14-3-19.
//

#import "NSDateFormatter+Category.h"
/**
 *  为SDK自带的 NSDate 类添加一些实用方法
 */
@interface NSDate (Category)

/* 日期字符串转换为 NSDate */
+ (NSDate *)dateFromString:(NSString *)dateStr;
+ (NSDate *)dateFromYDMHmsString:(NSString *)dateStr;

/* 当前NSDate转为字符串 */
- (NSString *)toString;

/* 获取yyyy/mm/dd 格式日期 */
- (NSString *)getYMDShortString;

/* 比较两个时间之间差距的绝对值 */
- (NSTimeInterval)absIntervalSinceDate:(NSDate *)date;

/* 当前时间对象和现在时间差的绝对值 */
- (NSTimeInterval)absIntervalSinceNow;

/* 根据时间戳计算天、小时、时、分 秒*/
+ (NSString *)getTimeByInterval:(NSTimeInterval)interval;
/* 根据时间戳计算天、小时、时、分 */
+ (NSString *)getTimeWithoutSecondByInterval:(NSTimeInterval)interval;

/* 获取当前时间戳*/
+ (NSString *)getTimeStamp;

//生成xx年xx月xx日格式
- (NSString *)getYMDString;

//生成xx月-xx日格式
- (NSString *)getMDDateString;

+ (NSString *)getTimeWithoutMinuteByInterval:(NSTimeInterval)interval;

//生成年
- (NSString *)getYear;

//生成月
- (NSString *)getMonth;

// 生成日
- (NSString *)getDay;

/* 根据时间戳计算年 月 日*/
+ (NSString *)getYMDByInterval:(NSTimeInterval)interval;

//获取当前时间戳
+ (NSTimeInterval)getCurrentTimestapms;
@end
