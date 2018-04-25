//
//  NSString+file.m
//  SinaNews
//
//  Created by 王海军 on 14/12/22.
//  Copyright (c) 2014年 HJ. All rights reserved.
//

#import "NSString+File.h"

@implementation NSString (File)

- (NSString *)fileNameAppend:(NSString *)append
{
    // 1、获取没有拓展名的文件名(先删除自己的扩展名)
    NSString *fileName = [self stringByDeletingPathExtension];
    // 2、拼接append
    fileName = [fileName stringByAppendingString:append];
    // 3、拼接拓展名
    NSString *extension = [self pathExtension];
    // 4、生成新的文件名
    return [fileName stringByAppendingPathExtension:extension];
}


- (NSString *)URLEncodedString
{
    /*
     CFURLCreateStringByAddingPercentEscapes函数是Core Foundation框架提供的C函数，可以把内容转换成URL【资源定位符】编码，
     
     */
    
    NSString *result = ( NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              (CFStringRef)self,
                                                              NULL,//指定了将本身为非法的URL字符不进行编码的字符集合
                                                              CFSTR("!*();+$,%#[] "),//将本身为合法的URL字符需要进行编码的字符集合
                                                              kCFStringEncodingUTF8));
    return result;
}

@end
