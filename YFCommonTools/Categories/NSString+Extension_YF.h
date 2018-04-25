//
//  NSString+Extension_YF.h
//  YFToolsDemo
//
//  Created by apple on 2018/4/25.
//  Copyright © 2018年 BigShow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension_YF)

#pragma mark - 缓存路径
/**
 *  返回缓存路径的完整路径名
 */
- (NSString *)cacheDir;
/**
 *  返回文档路径的完整路径名
 */
- (NSString *)documentDir;
/**
 *  返回临时路径的完整路径名
 */
- (NSString *)tmpDir;


#pragma mark - base64加密解密

/**
 *  用base64的方式给字符串进行编码
 *
 *  @param str 需要编码的字符串
 *
 *  @return 编码完成的字符串
 */
- (NSString *)base64EncodeStr:(NSString *)str;

/**
 *  用base64的方式给字符串进行解码
 *
 *  @param str 需要解码的字符串
 *
 *  @return 解码完成的字符串
 */
- (NSString *)base64DecodeStr:(NSString *)str;

#pragma mark - 计算文件大小
/**
 *  计算当前文件\文件夹的内容大小
 */
- (NSInteger)fileSize;
@end
