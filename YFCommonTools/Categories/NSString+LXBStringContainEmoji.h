//
//  NSString+LXBStringContainEmoji.h
//  SmartingPark
//
//  Created by lianxingbo on 15/9/25.
//  Copyright (c) 2015年 智慧停车. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LXBStringContainEmoji)

/**
 *  判断是否包含emoji表情
 *
 *  @param string 需要判断的字符串
 *
 *  @return 返回yes or no
 */

+ (BOOL)stringContainsEmoji:(NSString *)string;

/**
 *  判断是否为空，全部是空格或者回车，或者两者都有
 *
 *  @param string 需要判断的字符串
 *
 *  @return 返回 yes or no
 */
+ (BOOL)isNilForText:(NSString *)string;

//- (CGSize)textWithSize:(CGFloat)font andMaxSize:(CGSize)maxSize;

@end
