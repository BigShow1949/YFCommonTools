//
//  NSString+Extension_yf.h
//  YFToolsDemo
//
//  Created by apple on 2018/4/25.
//  Copyright © 2018年 BigShow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension_yf)

// 文件路径拼接 数据存储

//

#pragma mark - emoji表情
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

#pragma mark - 空字符串判断
/**
 *  如果字符串为空则返回 "", <null> (null) 0 都算空字符
 *
 *  @param str 需要判断的字符串
 *
 */
+ (NSString *)stringWithoutNilFormart:(NSString *)str;

#pragma mark - 时间转换  (时间差)  获取的时间距离现在多少
//22.时间戳转换字符串(获取的时间距离现在多少)
+ (NSString *)timeSinceNow: (NSString *) theDate;

//36.时间戳转换成指定格式
+ (NSString *)timeChange:(NSString *)time withFormatter:(NSString *)matter;

//39.时间差
+ (NSString *)dateTimeDifferenceWithEndtime:(NSString *)endtime;

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

#pragma mark - 正则表达式判断
//验证纯字母
- (BOOL)validateAllLetter;
//验证纯数字
- (BOOL)validateAllNumber;
//验证银行卡
- (BOOL)validateBandCard;
//验证身份证
- (BOOL)validateIDCard;
//验证手机号码
- (BOOL)validateMobilePhone;
//验证固定电话号码
- (BOOL)validateTelePhone;
//非负整数
- (BOOL)validateUnsignedInt;
//普通字符串，字母数字汉字和空格
- (BOOL)validateNormalString;
//普通字符串，字母数字 密码
- (BOOL)validatePassowrdString;
//空格或汉字字符串
- (BOOL)validateChineseString;
//邮箱
- (BOOL)validateEMail;
// MD5转成字符串
- (NSString *)stringFromMD5;
//MD5大写字母串
- (NSString *)md5UppercaseStringUsingEncoding:(NSStringEncoding)encoding;
//MD5小写字母串
- (NSString *)md5LowercaseStringUsingEncoding:(NSStringEncoding)encoding;
//截取电话中四位****
+ (NSString *)cutoffStr:(NSString *)str;

#pragma mark - 缓存路径
/**
 *  返回缓存路径的完整路径名
 */
- (NSString *)cacheDir;
/**
 *  返回文档路径的完整路径名
 */
- (NSString *)documentDir;
/**
 *  返回临时路径的完整路径名
 */
- (NSString *)tmpDir;


#pragma mark - base64加密解密

/**
 *  用base64的方式给字符串进行编码
 *
 *  @param str 需要编码的字符串
 *
 *  @return 编码完成的字符串
 */
- (NSString *)base64EncodeStr:(NSString *)str;

/**
 *  用base64的方式给字符串进行解码
 *
 *  @param str 需要解码的字符串
 *
 *  @return 解码完成的字符串
 */
- (NSString *)base64DecodeStr:(NSString *)str;

#pragma mark - 计算文件大小
/**
 *  计算当前文件\文件夹的内容大小
 */
- (NSInteger)fileSize;

#pragma mark - 汉语转拼音
/**
 *  汉语转拼音
 */
- (NSString *)getPinYinFromString:(NSString *)string;
@end
