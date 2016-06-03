//
//  UIViewController+_Keyboard.m
//  IOSAPPFramework
//
//  Created by 吴华林 on 16/6/1.
//  Copyright © 2016年 吴华林. All rights reserved.
//
#import <objc/runtime.h>
#import "UIViewController+Keyboard.h"

@implementation RootViewController (Keyboard)
#pragma mark keyBoard event
- (void)keyboardWillShow:(NSNotification *)notification
{
    NSValue *keyBoardValue = [notification.userInfo objectForKey:@"UIKeyboardFrameEndUserInfoKey"];
    CGRect keyBoardFrame = [keyBoardValue CGRectValue];
    float animationDuration = [[notification.userInfo objectForKey:@"UIKeyboardAnimationDurationUserInfoKey"] floatValue];
    NSInteger animationCurve = [[notification.userInfo objectForKey:@"UIKeyboardAnimationCurveUserInfoKey"] integerValue];
    UIView *fristResponder = [[UIApplication sharedApplication].keyWindow performSelector:@selector(firstResponder)];
    if([fristResponder conformsToProtocol:@protocol(UITextInput)])
    {
        CGRect fristResponderRect = [[fristResponder superview] convertRect:fristResponder.frame  toView:[UIApplication sharedApplication].keyWindow];
        
        UIView *fristResponderBaseView = fristResponder;
        while ([fristResponderBaseView superview]!=self.view) {
            fristResponderBaseView = [fristResponderBaseView superview];
        }
        objc_setAssociatedObject(self, @"fristResponderBaseView", fristResponderBaseView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        if((fristResponderRect.origin.y+fristResponderRect.size.height)>keyBoardFrame.origin.y)
        {
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationCurve:animationCurve];
            [UIView animateWithDuration:animationDuration animations:^{
                fristResponderBaseView.transform = CGAffineTransformMakeTranslation(0, -(fristResponderRect.origin.y+fristResponderRect.size.height-keyBoardFrame.origin.y));
            }];
            [UIView commitAnimations];
        }
    }
    
}

- (void)keyboardWillHide:(NSNotification *)notification
{
    UIView *fristResponderBaseView = objc_getAssociatedObject(self, @"fristResponderBaseView");
    float animationDuration = [[notification.userInfo objectForKey:@"UIKeyboardAnimationDurationUserInfoKey"] floatValue];
    NSInteger animationCurve = [[notification.userInfo objectForKey:@"UIKeyboardAnimationCurveUserInfoKey"] integerValue];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationCurve:animationCurve];
    [UIView animateWithDuration:animationDuration animations:^{
        fristResponderBaseView.transform = CGAffineTransformIdentity;
    }];
    [UIView commitAnimations];
}

@end
