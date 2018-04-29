//
//  YFSaveTool.h
//  QuanJieShopProject
//
//  Created by apple on 2018/4/27.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "YFArcherCoder.h"
#import "YFArcherModel.h"
#import "NSObject+Archiver.h"

typedef NS_ENUM(NSInteger, SystemPathType){ // 系统文件路径
    SystemPathType_Home = 0, // Home目录
    SystemPathType_Document,
    SystemPathType_Cache,
    SystemPathType_Library,
};


@interface YFSaveTool : NSObject

#pragma mark - plist

+ (BOOL)plistSaveWithArray:(NSArray *)array fileName:(NSString *)fileName;
+ (NSArray *)plistReadArryWithFileName:(NSString *)fileName;

+ (BOOL)plistSaveWithDictionary:(NSDictionary *)dict fileName:(NSString *)fileName;
+ (NSDictionary *)plistReadDictionaryWithFileName:(NSString *)fileName;

#pragma mark - NSUserDefaults
// 存储
+ (void)userDefaults:(NSString *)stringTmp key:(NSString *)key;
// 读取
+ (NSString *)userDefaults:(NSString *)string;
// 删除
+ (void)userDefaultsRemoveWithKey:(NSString *)key;

#pragma mark - NSKeyedArchiver

 // 见 NSObject+Archiver.h 文件 

#pragma mark - CoreData

#pragma mark - FMDB


//4.获取系统相关路径
+ (NSString *)getSystemPath:(SystemPathType)path;


//23.读取程序内置资源的text文件
+ (NSString *)readTxt:(NSString *)fileName;

//24.读取程序内置资源文件
+ (NSString *)readFile:(NSString *)fileName fileType:(NSString *)fileType;


//32.将对象保存为plist文件--保存对象,Plist保存路径是带有文件名字的
+ (NSInteger)savePlist:(id)saveObject localPath:(NSString *)localPathTmp;

//33.通过目录读取plist
+ (NSDictionary *)readPlist:(NSString *)loaclpath;

//34.判断文件夹是否存在，不存在则创建
+ (void)isDirectoryExist:(NSString *)dirPath;


@end
