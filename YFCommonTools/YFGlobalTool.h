//
//  YFGlobalTool.h
//  QuanJieShopProject
//
//  Created by apple on 2018/4/27.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

/*****************  全局工具(主要是一些零散工具)  *******************/

typedef NS_ENUM(NSInteger, NetworkType){ // 当前网络状态类型
    NetworkType_Offline = 0,
    NetworkType_2G,
    NetworkType_3G,
    NetworkType_4G,
    NetworkType_LTE,
    NetworkType_WIFI,
};

typedef NS_ENUM(NSInteger, SystemPathType){ // 系统文件路径
    SystemPathType_Home = 0, // Home目录
    SystemPathType_Document,
    SystemPathType_Cache,
    SystemPathType_Library,
};

@interface YFGlobalTool : NSObject

// 1.打电话
+ (void)callWithPhoneNumber:(NSString *)phoneNumber;

//2.判断网络状态
+ (NetworkType)getNetworkType;

//3.判断是否越狱
+ (BOOL)isJailBroken;

//4.获取系统相关路径
+ (NSString *)getSystemPath:(SystemPathType)path;

//5.打开另一个程序
+ (BOOL)openOtherAPP:(NSString *)urlSchemes;

//6.字典转换为Json字符串
+ (NSString *)dictChangeToJsonStr:(NSDictionary *)dict;

// 7.计算size
+ (CGSize)sizeWithString:(NSString *)str font:(int)font; // 默认最大size
+ (CGSize)sizeWithString:(NSString *)str font:(int)font maxSize:(CGSize)maxSize;

// 获取App的版本号
+ (NSString *)appVersion;


@end
