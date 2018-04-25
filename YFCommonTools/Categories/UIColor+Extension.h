//
//  UIColor+Extension.h
//  SJZ
//
//  Created by zhht01 on 16/3/31.
//  Copyright © 2016年 智慧停车. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)

// 宏定义
#define YFColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define YFBgColor YFColor(238,238,238)
// YFColor(239,239,244)
#define GlobalBlueBtnBgColor [UIColor colorWithHexString:@"009FE8"]
#define YFLineColor YFColor(220,221,222)
#define YFBlackColor [UIColor colorWithHexString:@"333333"]
#define YFLightGrayColor [UIColor colorWithHexString:@"999999"]
#define YFOrangeColor [UIColor colorWithHexString:@"fa7a24"] // 橙黄色
#define YFDarkBlueColor [UIColor colorWithHexString:@"#002f7b"] // 深蓝色
#define YFLightGreenColor [UIColor colorWithHexString:@"#9cc813"] // 浅绿色

#define YFHighlightedColor [UIColor colorWithHexString:@"#6d8c0d"]  // 按钮高亮状态
//[UIColor colorWithHexString:@"999999"]


/**
 *  从十六进制字符串获取颜色
 *
 *  @param color : @“#123456”、 @“0X123456”、@“0x123456”、  @“123456”三种格式
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
