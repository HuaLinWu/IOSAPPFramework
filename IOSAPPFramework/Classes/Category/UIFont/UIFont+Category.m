//
//  UIFont+Category.m
//  IOSAPPFramework
//
//  Created by 吴华林 on 16/6/30.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import "UIFont+Category.h"

@implementation UIFont (Category)
/**
 *  设置美工给的效果图px的值
 */
- (void)fontWithName:(NSString *)fontName pxsize:(CGFloat)fontSize
{
    CGFloat adjustFontSize = [UIFont adjustPtForPx:fontSize];
    return[self fontWithName:fontName pxsize:adjustFontSize];
}
/**
 *  设置美工给的效果图px的值设置系统字体
 */
+ (UIFont *)systemFontOfPxSize:(CGFloat)fontSize
{
    CGFloat adjustFontSize = [self adjustPtForPx:fontSize];
    return [UIFont systemFontOfSize:adjustFontSize];
}
/**
 *  设置美工给的效果图px的值设置加粗的字体
 */
+ (UIFont *)boldSystemFontOfPxSize:(CGFloat)fontSize
{
    CGFloat adjustFontSize = [self adjustPtForPx:fontSize];
    return [UIFont boldSystemFontOfSize:adjustFontSize];
}
/**
 *  设置美工给的效果图px的值设置斜体字体
 */
+ (UIFont *)italicSystemFontOfPxSize:(CGFloat)fontSize
{
    CGFloat adjustFontSize = [self adjustPtForPx:fontSize];
    return [UIFont italicSystemFontOfSize:adjustFontSize];
}
+ (float)adjustPtForPx:(float)px
{
    float scale =2;
    float pt = px/scale;
    float currentWidth  = [UIScreen mainScreen].bounds.size.width;
    float referenceWidth = 375;

    if([referenceSystem isEqualToString:@"4s"])
    {
        referenceWidth  = 320;
        scale = 2;
    }
    else if([referenceSystem isEqualToString:@"5"])
    {
        referenceWidth  = 320;
        scale = 2;
    }
    else if([referenceSystem isEqualToString:@"5s"])
    {
        referenceWidth  = 320;
        scale = 2;
    }
    else if([referenceSystem isEqualToString:@"6"])
    {
        referenceWidth  = 375;
        scale = 2;
    }
    else if([referenceSystem isEqualToString:@"6plus"])
    {
        referenceWidth  = 414;
        scale = 3;
    }
    else if([referenceSystem isEqualToString:@"6splus"])
    {
        referenceWidth  = 414;
        scale = 3;
    }
    else
    {
        //默认是6s的
        referenceWidth = 375;
        scale = 2;
    }
    pt = px/scale;
    pt =pt/referenceWidth*currentWidth;
    pt =floor(pt+0.5);
    return pt;
}
@end
