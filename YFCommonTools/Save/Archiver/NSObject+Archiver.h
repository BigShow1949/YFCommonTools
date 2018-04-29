//
//  NSObject+Archiver.h
//  YFToolsDemo
//
//  Created by apple on 2018/4/27.
//  Copyright © 2018年 BigShow. All rights reserved.
//

#import <Foundation/Foundation.h>
/// 文件目录名字
extern NSString * const archiverFileDirectoryName;

@interface NSObject (Archiver)

/**************    只能存储模型,不能存字典/数组等       ******************
 **************  默认存储在 SystemPathType_Document  ******************/
/**
 *  通过自定的名字归档
 *
 *  @param name 名字
 *
 *  @return 是否成功
 */
- (BOOL)archiveWithName:(NSString *)name;

/**
 *  通过之前归档的名字解归档
 *
 *  @param name 名字
 *
 *  @return 解归档的对象
 */
+ (id)unArchiveWithName:(NSString *)name;

@end
