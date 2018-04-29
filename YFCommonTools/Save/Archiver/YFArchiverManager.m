//
//  YFArchiverManager.m
//  YFToolsDemo
//
//  Created by apple on 2018/4/28.
//  Copyright © 2018年 BigShow. All rights reserved.
//

#import "YFArchiverManager.h"
#import "YFSaveTool.h"

@implementation YFArchiverManager
+ (void)clearAll {
    NSString *documentPath = [YFSaveTool getSystemPath:SystemPathType_Document];
    
    NSFileManager *fileManager = [NSFileManager new];
    
    [fileManager changeCurrentDirectoryPath:documentPath];
    
    NSError *error = nil;
    
    [fileManager removeItemAtPath:archiverFileDirectoryName error:&error];
    
    NSAssert(error == nil, @"删除出错");
}

+ (void)clear:(NSString *)className {
    NSFileManager *fileManager = [NSFileManager new];
    
    [fileManager changeCurrentDirectoryPath: [[self class] archiverPath]];
    
    NSError *error = nil;
    
    NSArray *fileLists = [fileManager contentsOfDirectoryAtPath:fileManager.currentDirectoryPath error:&error];
    
    NSAssert(error == nil, @"查询出错");
    
    for (NSString *fileName in fileLists) {
        if ([fileName hasPrefix: className]) {
            NSError *removeError = nil;
            [fileManager removeItemAtPath: fileName error: &removeError];
            NSAssert(removeError == nil, @"删除出错");
        }
    }
}

+ (void)clear:(NSString *)className andName:(NSString *)name {
    NSFileManager *fileManager = [NSFileManager new];
    
    [fileManager changeCurrentDirectoryPath:[[self class] archiverPath]];
    
    NSError *error = nil;
    
    [fileManager removeItemAtPath:[NSString stringWithFormat:@"%@_%@.archiver", className, name] error: &error];
    
    NSAssert(error == nil, @"删除出错");
}



+ (NSString *)archiverPath {
    return [[YFSaveTool getSystemPath:SystemPathType_Document] stringByAppendingPathComponent:archiverFileDirectoryName];
}
@end
