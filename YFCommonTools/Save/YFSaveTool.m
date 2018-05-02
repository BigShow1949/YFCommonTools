//
//  YFSaveTool.m
//  QuanJieShopProject
//
//  Created by apple on 2018/4/27.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "YFSaveTool.h"

NSString * const plistFileDirectoryName = @"YFPlistSave";


@implementation YFSaveTool

#pragma mark -- plist
+ (BOOL)plistSaveWithArray:(NSArray *)array fileName:(NSString *)fileName {
    NSString *docPath = [YFSaveTool getSystemPath:SystemPathType_Document];
    NSString *path = [docPath stringByAppendingPathComponent: [NSString stringWithFormat:@"%@/%@.plist", plistFileDirectoryName, fileName]];
    BOOL result = [array writeToFile:path atomically:YES];
    return result;
}

+ (BOOL)plistSaveWithDictionary:(NSDictionary *)dict fileName:(NSString *)fileName {
    NSString *docPath = [YFSaveTool getSystemPath:SystemPathType_Document];
    NSString *path = [docPath stringByAppendingPathComponent: [NSString stringWithFormat:@"%@/%@.plist", plistFileDirectoryName, fileName]];
    BOOL result = [dict writeToFile:path atomically:YES];
    return result;
}

+ (NSArray *)plistReadArryWithFileName:(NSString *)fileName {
    NSString *docPath = [YFSaveTool getSystemPath:SystemPathType_Document];
    NSString *path = [docPath stringByAppendingPathComponent: [NSString stringWithFormat:@"%@/%@.plist", plistFileDirectoryName, fileName]];
    return [NSArray arrayWithContentsOfFile:path];
}
+ (NSDictionary *)plistReadDictionaryWithFileName:(NSString *)fileName {
    NSString *docPath = [YFSaveTool getSystemPath:SystemPathType_Document];
    NSString *path = [docPath stringByAppendingPathComponent: [NSString stringWithFormat:@"%@/%@.plist", plistFileDirectoryName, fileName]];
    return [NSDictionary dictionaryWithContentsOfFile:path];
}

#pragma mark -- NSUserDefaults

+ (void)userDefaults:(NSString *)string key:(NSString *)key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:string forKey:key];
    [defaults synchronize];
}
+ (NSString *)userDefaults:(NSString *)string{
    NSString *str = [[NSUserDefaults standardUserDefaults] objectForKey:string];
    return str;
}
+ (void)userDefaultsRemoveWithKey:(NSString *)key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:key];
}


#pragma mark -- NSKeyedArchiver

#pragma mark -- CoreData
+ (void)coreDataSaveWithName:(NSString *)name {
    
}
#pragma mark -- FMDB




#pragma mark -- 4.获取系统相关路径
+ (NSString *)getSystemPath:(SystemPathType)path {
    NSString *pathTmp;
    if (path == SystemPathType_Home) {
        NSString *homeDirectory = NSHomeDirectory();
        pathTmp = homeDirectory;
        
    }else if (path == SystemPathType_Document) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *path= [paths objectAtIndex:0];
        pathTmp = path;
        
    }else if (path == SystemPathType_Cache) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        NSString *path = [paths objectAtIndex:0];
        pathTmp = path;
        
    }else if (path == SystemPathType_Library) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
        NSString *path = [paths objectAtIndex:0];
        pathTmp = path;
    }
    return pathTmp;
}
#pragma mark -- 23.读取程序内置资源的text文件
+ (NSString *)readTxt:(NSString *)fileName{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"txt" ];
    NSData *myData = [NSData dataWithContentsOfFile:filePath];
    NSString *tmp;
    tmp = [[NSString alloc]initWithData:myData encoding:4];
    return tmp;
}
#pragma mark -- 24.读取程序内置资源文件
+ (NSString *)readFile:(NSString *)fileName fileType:(NSString *)fileType{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:fileType];
    NSData *myData = [NSData dataWithContentsOfFile:filePath];
    return [[NSString alloc]initWithData:myData encoding:NSUTF8StringEncoding];
}

#pragma mark -- 32.将对象保存为plist文件--保存对象,Plist保存路径是带有文件名字的
+ (NSInteger)savePlist:(id)saveObject localPath:(NSString *)localPathTmp{
    NSInteger resultTmp = 0;
    
    NSError *error = nil;
    NSData *representation = [NSPropertyListSerialization dataWithPropertyList:saveObject format:NSPropertyListXMLFormat_v1_0 options:0 error:&error];
    if (!error) {
        BOOL ok = [representation writeToFile:localPathTmp atomically:YES];
        if (ok){
#ifdef DEBUG
            NSLog(@"ok!");
#endif
            resultTmp = 0;
        }
        else{
            resultTmp = 1;
#ifdef DEBUG
            NSLog(@"read plist error =%@",localPathTmp);
#endif
        }
    }else{
        resultTmp = 1;
#ifdef DEBUG
        NSLog(@"ListSerialization error %@!",error);
#endif
    }
    
    return resultTmp;
}
#pragma mark -- 33.通过目录读取plist
+ (NSDictionary *)readPlist:(NSString *)loaclpath{
    NSData *plistData = [NSData dataWithContentsOfFile:loaclpath];
    if (!plistData)
    {
#ifdef DEBUG
        NSLog(@"error reading from file: %@", loaclpath);
#endif
        return @{@"": @""};
    }
    NSPropertyListFormat format;
    NSError *error = nil;
    id plist = [NSPropertyListSerialization propertyListWithData:plistData options:NSPropertyListMutableContainersAndLeaves format:&format error:&error];
    NSMutableDictionary *root = nil;
    if (!error){
        root = plist;
    }else{
#ifdef DEBUG
        NSLog(@"error: %@", error);
#endif
    }
    
    return [root copy];
}
#pragma mark -- 34.判断文件是否存在，不存在则创建
+ (void)isDirectoryExist:(NSString *)dirPath{
    BOOL isDir = NO;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL existed = [fileManager fileExistsAtPath:dirPath isDirectory:&isDir];
    if ( !(isDir == YES && existed == YES) ){
        [fileManager createDirectoryAtPath:dirPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
}


@end
