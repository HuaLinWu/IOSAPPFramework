//
//  NSDate+Category.m
//  haofang
//
//  Created by Aim on 14-3-19.
//

@implementation NSDate (Category)

/**
 *  日期字符串转换为 NSDate
 *
 *     输入的日期字符串形如：@"2010-05-21"
 */
+ (NSDate *)dateFromString:(NSString *)dateStr {
	NSDateFormatter *formatter = [NSDateFormatter staticDateFormatter];

	[formatter setDateFormat: @"yyyy-MM-dd"];
	NSDate *retDate = [formatter dateFromString:dateStr];

	return retDate;
}

+ (NSDate *)dateFromYDMHmsString:(NSString *)dateStr
{
    NSDateFormatter *formatter = [NSDateFormatter staticDateFormatter];
    
	[formatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
	NSDate *retDate = [formatter dateFromString:dateStr];
    
	return retDate;
}



/**
 *  当前NSDate转为字符串
 *
 *     输出的日期字符串形如：@"2010-05-21"
 */
- (NSString *)toString {
	return [NSString stringFromDate:self];
}

/* 获取yyyy/mm/dd 格式日期 */
- (NSString *)getYMDShortString {
    NSDateFormatter *formatter = [NSDateFormatter staticDateFormatter];
    
    [formatter setDateFormat:@"yyyy/MM/dd"];
    NSString *retStr = [formatter stringFromDate:self];
    
    return retStr;
}

/* 比较两个时间之间差距的绝对值 */
- (NSTimeInterval)absIntervalSinceDate:(NSDate *)date {
    return fabs([self timeIntervalSinceDate:date]);
}

/* 当前时间对象和现在时间差的绝对值 */
- (NSTimeInterval)absIntervalSinceNow {
    return fabs([self timeIntervalSinceNow]);
}

/* 根据时间戳计算天、小时、时、分 */
// 今天和昨天显示yyyy-MM-dd，两天以前显示yyyy-MM-dd HH:mm:ss
+ (NSString *)getTimeByInterval:(NSTimeInterval)interval{
    NSString *timeDes = @"";
    NSDate* now  = [NSDate dateWithTimeIntervalSinceNow:0];
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:interval];
    NSDateFormatter* formatter = [NSDateFormatter staticDateFormatter];
    
    NSTimeInterval timeBetween = [now timeIntervalSinceDate:date];
    if (timeBetween > 2 * 24 * 60 * 60) {
        [formatter setDateFormat:@"yyyy-MM-dd"];
        timeDes = [formatter stringFromDate:date];
    }else{
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        timeDes = [formatter stringFromDate:date];
    }
    
    if (interval == 0) {
        timeDes = @"";
    }

    return timeDes;
}

+ (NSString *)getTimeWithoutSecondByInterval:(NSTimeInterval)interval{
    NSString *timeDes = @"";
    NSDate* now  = [NSDate dateWithTimeIntervalSinceNow:0];
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:interval];
    NSDateFormatter* formatter = [NSDateFormatter staticDateFormatter];
    
    NSTimeInterval timeBetween = [now timeIntervalSinceDate:date];
    if (timeBetween > 2 * 24 * 60 * 60) {
        [formatter setDateFormat:@"yyyy-MM-dd"];
        timeDes = [formatter stringFromDate:date];
    }else{
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
        timeDes = [formatter stringFromDate:date];
    }
    
    if (interval == 0) {
        timeDes = @"";
    }
    
    return timeDes;
}

//获取到分.
+ (NSString *)getTimeWithoutMinuteByInterval:(NSTimeInterval)interval{
    NSString *timeDes = @"";
    NSDate* now  = [NSDate dateWithTimeIntervalSinceNow:0];
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:interval];
    NSDateFormatter* formatter = [NSDateFormatter staticDateFormatter];
    
    NSTimeInterval timeBetween = [now timeIntervalSinceDate:date];
    if (timeBetween > 2 * 24 * 60 * 60) {
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
        timeDes = [formatter stringFromDate:date];
    }else{
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
        timeDes = [formatter stringFromDate:date];
    }
    
    if (interval == 0) {
        timeDes = @"";
    }
    
    return timeDes;
}

+ (NSString *)getTimeStamp {
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSString *timeString = [NSString stringWithFormat:@"%ld", (long)[dat timeIntervalSince1970]];
    
    return timeString;
}

- (NSString *)getMDDateString{
    NSUInteger componentFlags = 0;
    #if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_8_0
     componentFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    #else
    componentFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    #endif
    NSDateComponents *components = [[NSCalendar currentCalendar] components:componentFlags fromDate:self];
    
    NSString *months,*days;
    
    NSInteger month = [components month];
    NSInteger day = [components day];
    
    if (month<10) {
        months = [NSString stringWithFormat:@"0%zd",month];
    }else{
        months = [NSString stringWithFormat:@"%zd",month];
    }
    
    if (day<10) {
        days = [NSString stringWithFormat:@"0%zd",day];
    }else{
        days = [NSString stringWithFormat:@"%zd",day];
    }
    return [NSString stringWithFormat:@"%@-%@",months,days];
}

- (NSString *)getYMDString{
    
    NSUInteger componentFlags = 0;
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_8_0
    componentFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
#else
    componentFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
#endif
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:componentFlags fromDate:self];
    
    NSInteger year = [components year];
    
    NSInteger month = [components month];
    
    NSInteger day = [components day];
    
    return [NSString stringWithFormat:@"%zd年%zd月%zd日",year,month,day];
}

//生成年
- (NSString *)getYear
{
    NSUInteger componentFlags = 0;
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_8_0
    componentFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
#else
    componentFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
#endif
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:componentFlags fromDate:self];

    NSInteger year = [components year];
    return [NSString stringWithFormat:@"%ld", (long)year];
}

//生成月
- (NSString *)getMonth
{
    NSUInteger componentFlags = 0;
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_8_0
    componentFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
#else
    componentFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
#endif
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:componentFlags fromDate:self];
    
    NSString *months;
    NSInteger month = [components month];
    
    if (month<10) {
        months = [NSString stringWithFormat:@"0%zd",month];
    }else{
        months = [NSString stringWithFormat:@"%zd",month];
    }
    return [NSString stringWithFormat:@"%@",months];
}

// 生成日
- (NSString *)getDay
{
    NSUInteger componentFlags = 0;
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_8_0
    componentFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
#else
    componentFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
#endif
    NSDateComponents *components = [[NSCalendar currentCalendar] components:componentFlags fromDate:self];
    NSString *days;
    NSInteger day = [components day];
    
    if (day<10) {
        days = [NSString stringWithFormat:@"0%zd",day];
    }else{
        days = [NSString stringWithFormat:@"%zd",day];
    }
    return [NSString stringWithFormat:@"%@",days];
}

+ (NSString *)getYMDByInterval:(NSTimeInterval)interval
{
    NSString *timeDes = @"";
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:interval];
    NSDateFormatter* formatter = [NSDateFormatter staticDateFormatter];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    timeDes = [formatter stringFromDate:date];
    if (interval == 0) {
        timeDes = @"";
    }
    return timeDes;
}

+ (NSTimeInterval)getCurrentTimestapms{
    NSDate *currentDate = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval currentTime = [currentDate timeIntervalSince1970];
    return currentTime;
}

@end
