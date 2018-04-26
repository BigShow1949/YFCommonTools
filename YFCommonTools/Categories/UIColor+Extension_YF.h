//
//  UIColor+Extension_YF.h
//  YFToolsDemo
//
//  Created by apple on 2018/4/25.
//  Copyright © 2018年 BigShow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension_YF)

// 可以在项目中的全局文件里写这些
//#define YFColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

#pragma mark - 生成颜色
/**
 *  从十六进制字符串获取颜色
 *
 *  @param hexString : @“#123456”、 @“0X123456”、@“0x123456”、  @“123456”三种格式
 *  @param alpha : 透明度 默认为1
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;
+ (UIColor *)colorWithHexString:(NSString *)hexString;

/**
 *  从RGB字符串获取颜色
 *
 *  注意:不需要除以255
 */
+ (UIColor *)colorWithRGBRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
+ (UIColor *)colorWithRGBRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;

#pragma mark - 颜色/字符串 转换
/**
 *  将颜色转成 16进制
 *
 *  返回颜色格式 : #123456
 */
+ (NSString *)colorToHexStringWithColor:(UIColor *)color;

/**
 *  将颜色转成 RGB
 *
 *  返回颜色格式 : 192,192,222
 */
+ (NSString *)colorToRGBStringWithColor:(UIColor *)color;

/**
 *  将 16进制颜色 转成 RGB颜色
 *
 *  @param hexString : @“#123456”、 @“0X123456”、@“0x123456” 、 @“123456” 四种格式
 *
 *  返回颜色格式 : RGB:192,192,222
 */
+ (NSString *)colorToRGBStringWithHexString:(NSString *)hexString;

/**
 *  将 RGB颜色 转成 16进制颜色
 *
 *  返回颜色格式 : #123456
 */
+ (NSString *)colorToHexStringWithRGBRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;;

@end
