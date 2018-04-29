//
//  YFArchiverManager.h
//  YFToolsDemo
//
//  Created by apple on 2018/4/28.
//  Copyright © 2018年 BigShow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YFArchiverManager : NSObject
/**
 *  清除所有归档
 */
+ (void)clearAll;

/**
 *  清除一个类别的归档
 *
 *  @param className 类别的名字
 */
+ (void)clear:(NSString *)className;

/**
 *  清除一个(className = 类别) && (name = 归档对象的名字)的归档
 *
 *  @param className 类别的名字
 *  @param name      归档对象的名字
 */
+ (void)clear:(NSString *)className andName:(NSString *)name;

@end
