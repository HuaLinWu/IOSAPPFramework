//
//  UIFont+Category.h
//  IOSAPPFramework
//   字体分类
//  Created by 吴华林 on 16/6/30.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (Category)
/**
 *  设置美工给的效果图px的值
 */
- (void)fontWithName:(NSString *)fontName pxsize:(CGFloat)fontSize;
/**
 *  设置美工给的效果图px的值设置系统字体
 */
+ (UIFont *)systemFontOfPxSize:(CGFloat)fontSize;
/**
 *  设置美工给的效果图px的值设置加粗的字体
 */
+ (UIFont *)boldSystemFontOfPxSize:(CGFloat)fontSize;
/**
 *  设置美工给的效果图px的值设置斜体字体
 */
+ (UIFont *)italicSystemFontOfPxSize:(CGFloat)fontSize;
@end
