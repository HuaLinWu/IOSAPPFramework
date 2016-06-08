//
//  AbstractExpression.h
//  IOSAPPFramework
//
//  Created by 吴华林 on 16/6/8.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractContext.h"
@interface AbstractExpression : NSObject
/**
 *  对传入的对象进行解析
 *
 *  @param object 待解析的对象
 *
 *  @return 返回解析过后的context
 */
- (AbstractContext *)interpret:(id)object;
@end
