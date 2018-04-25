//
//  NSString+file.h
//  SinaNews
//
//  Created by 王海军 on 14/12/22.
//  Copyright (c) 2014年 HJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Time)

/**
 *  将 2016-06-22 14:11:57 格式转换为 2016年06月22日 14:11:57
 */
- (NSString *)changeToYearSec;

/**
 *  将 2016-06-22 14:11:57 格式转换为 2016年06月22日 14:11
 */
- (NSString *)changeToYearMin;

/**
 *  将 2016-06-22 14:11:57 格式转换为 2016年06月22日
 */
- (NSString *)changeToYearDay;


/**
 *  将 2016-06-22 14:11:57 格式转换为 2016年06月
 */
- (NSString *)changeToYearMonth;

/**
 *  获取 2016-06-22 14:11:57 的月份 (至少要有月2016-06)
 */
- (NSString *)getMonthStr;

/**
 *  获取 2016-06-22 14:11:57 的年 (至少要有年2016)
 */
- (NSString *)getYearStr;

/**
 *  将 2016-06-22 14:11:57 格式转换为 06月07日
 */
- (NSString *)changeToMonthDay;

/**
 *  获取 2016-06-22 14:11:57 的天 (至少要有天2016-06-22)
 */
- (NSString *)getDayStr;



@end
