//
//  YFGlobalMacro.h
//  YFToolsDemo
//
//  Created by apple on 2018/4/26.
//  Copyright © 2018年 BigShow. All rights reserved.
//

#import <Foundation/Foundation.h>

/******************************  全局宏  *********************************/


@interface YFGlobalMacro : NSObject

#pragma mark - 系统版本
//获取当前系统版本
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

#define IS_iOS8Later (IOS_VERSION >= 8.0)
#define IS_iOS9Later (IOS_VERSION >= 9.0)
#define IS_iOS10Later (IOS_VERSION >= 10.0)
#define IS_iOS11Later (IOS_VERSION >= 11.0)

#define IS_IOS8 (IOS_VERSION == 8.0)
#define IS_IOS9 (IOS_VERSION == 9.0)
#define IS_IOS10 (IOS_VERSION == 10.0)
#define IS_IOS11 (IOS_VERSION == 11.0)


#pragma mark - 设备型号
#define IS_iPhone4 ([UIScreen mainScreen].bounds.size.height == 480)
// 或者 se 5c
#define IS_iPhone5 ([UIScreen mainScreen].bounds.size.height == 568)
// 或者iPhone7,iPhone8
#define IS_iPhone6 ([UIScreen mainScreen].bounds.size.height == 667)
// 或者iPhone7P,iPhone8P
#define IS_iPhone6P ([UIScreen mainScreen].bounds.size.height == 736)
#define IS_iPhoneX ([UIScreen mainScreen].bounds.size.height == 812)


#pragma mark - 物理屏幕尺寸
#define Height_TabBar (IS_iPhoneX ? 83.f : 49.f)
#define Height_NavContentBar 44.0f
#define Height_StatusBar (IS_iPhoneX ? 44.0f: 20.0f)
#define Height_NavBar (IS_iPhoneX ? 88.0f: 64.0f)

#define UISCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define UISCREEN_HEIGHT  [UIScreen mainScreen].bounds.size.height


#pragma mark - 其他调试
// 自定义Log
#ifdef DEBUG // 调试
#define MyLog(yyy, ...) NSLog(@"%s(%d): " yyy, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else // 发布打包
#define MyLog(...)
#endif


//是否为真机运行
#if TARGET_IPHONE_SIMULATOR
//模拟器运行
#else
//真机运行 TARGET_OS_IPHONE
#endif


#define kWeakSelf typeof(self) __weak weakSelf = self;

@end
