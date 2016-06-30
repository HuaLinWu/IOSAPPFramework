//
//  UIView+Frame.m
//  IOSAPPFramework
//
//  Created by 吴华林 on 16/6/23.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)
- (float)x
{
    return self.origin.x;
}
- (float)y
{
    return self.origin.y;
}
- (float)width
{
    return self.size.width;
}
- (float)height
{
    return self.size.height;
}
-(void)setX:(float)x
{
    CGPoint origin = self.origin;
    origin.x = x;
    self.origin = origin;
}
- (void)setY:(float)y
{
    CGPoint origin = self.origin;
    origin.y = y;
    self.origin = origin;
}
- (void)setWidth:(float)width
{
    CGSize size = self.size;
    size.width = width;
    self.size = size;
}
- (void)setHeight:(float)height
{
    CGSize size = self.size;
    size.height = height;
    self.size = size;
}
- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}
- (CGPoint)origin
{
    return self.frame.origin;
}
- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
- (CGSize)size
{
 return self.frame.size;
}

@end
