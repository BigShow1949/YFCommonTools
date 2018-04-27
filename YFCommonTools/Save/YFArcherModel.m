//
//  YFArcherModel.m
//  YFToolsDemo
//
//  Created by apple on 2018/4/27.
//  Copyright © 2018年 BigShow. All rights reserved.
//

#import "YFArcherModel.h"

@implementation YFArcherModel

// 本地路径
+ (NSString *)locatPath{
    NSString *chachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask , YES)lastObject];
    return [chachePath stringByAppendingPathComponent:@"archer.cde"];
}

// 归档存储信息
+ (void)saveAction:(id)dict {
    YFArcherCoder *archer = [[YFArcherCoder alloc] init];
    archer.dict = dict;
    //将自定义对象转化为二进制流 并写入沙盒 我们要进行以下操作
    //1.先创建一个NSMutableData对象
    NSMutableData *data = [NSMutableData data];
    //2.创建一个归档对象
    NSKeyedArchiver *archive = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    //3.归档
    [archive encodeObject:archer forKey:@"archer"];
    //4.完成归档
    [archive finishEncoding];
    //5.写入文件
    [data writeToFile: [[self class] locatPath] atomically:YES];
}

// 解档存储信息
+ (YFArcherCoder *)takeAction {
    //1.首先判断文件是否存在
    if(![[NSFileManager defaultManager] fileExistsAtPath:[[self class] locatPath]]){
        return nil;
    }
    //2.读取data对象
    NSData *data = [NSData dataWithContentsOfFile:[[self class] locatPath]];
    //3.穿件解归档对象
    NSKeyedUnarchiver *unarchive = [[NSKeyedUnarchiver alloc]initForReadingWithData:data];
    //4.解档 创建接受对象
    YFArcherCoder *archer =  [unarchive decodeObjectForKey:@"archer"];
    //5.完成解档
    [unarchive finishDecoding];
    //6.返回类对象
    return archer;
}
@end
