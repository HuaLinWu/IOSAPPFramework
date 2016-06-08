//
//  RootURLBaseHandle.h
//  IOSAPPFramework
//
//  Created by 吴华林 on 16/6/8.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import <Foundation/Foundation.h>
#define NavHttpScheme                  @"root"         //用来区别是跳转本地请求的url  Scheme 
#define NavURLViewIdentifierArgument   @"identifier"  //表示需要跳转的本地视图的唯一标示url的参数
#define NavURLViewArgument             @"argument"    //表示需要传递参数的base64的url参数
@interface RootURLBaseHandle : NSObject
/**
 *  责任中下一个节点
 */
@property (nonatomic,strong)RootURLBaseHandle *nextURLHandle;

/**
 *  初始化方法
 *
 *  @return 对应的对象
 */
+ (instancetype)shareHandle;
/**
 *  打开url 的方法
 *
 *  @param url 需要打开的url 的链接
 *
 *  @return 是否打开成功
 */
- (BOOL)openURL:(NSString *)url;

@end
