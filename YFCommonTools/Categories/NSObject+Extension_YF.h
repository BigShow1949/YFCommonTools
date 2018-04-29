//
//  NSObject+Extension_YF.h
//  YFToolsDemo
//
//  Created by apple on 2018/4/27.
//  Copyright © 2018年 BigShow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Extension_YF)
/**
 *  获取一个类所有的成员变量名
 *
 *  @return @[...]
 */
- (NSArray <NSString *> *)allPropertyNames;

@end
