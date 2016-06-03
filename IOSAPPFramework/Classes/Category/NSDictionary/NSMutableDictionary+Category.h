//
//  NSMutableDictionary+NSMutableDictionary_Category.h
//  IOSAPPFramework
//
//  Created by 吴华林 on 16/5/29.
//  Copyright © 2016年 吴华林. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (Category)
/**
 *  重写setObject 方法，确保Object 和 key 为空时不crash
 *
 */
- (void)setObjectEx:(id)anObject forKey:(id<NSCopying>)aKey;
/**
 *  防止key为空或者key对应的value为空导致crach
 */
- (id)objectForKeyEx:(id)aKey;
@end
