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

@interface YFSaveTool : NSObject

#pragma mark - plist

#pragma mark - NSUserDefaults
// 存储
+ (void)userDefaults:(NSString *)stringTmp key:(NSString *)key;
// 读取
+ (NSString *)userDefaults:(NSString *)string;
// 删除
+ (void)userDefaultsRemoveWithKey:(NSString *)key;

#pragma mark - NSKeyedArchiver

#pragma mark - CoreData

#pragma mark - FMDB




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
