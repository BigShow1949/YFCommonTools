//
//  YFArcherCoder.m
//  YFToolsDemo
//
//  Created by apple on 2018/4/27.
//  Copyright © 2018年 BigShow. All rights reserved.
//

#import "YFArcherCoder.h"
#import <objc/message.h>

@implementation YFArcherCoder
// 归档
- (void)encodeWithCoder:(NSCoder *)aCoder{
    unsigned int count = 0;
    // 获取 .h 中属性的个数 -- count
    Ivar *ivars = class_copyIvarList([YFArcherCoder class], &count);
    for (int index = 0; index < count; index ++) {
        Ivar ivar = ivars[index];
        // 取出属性名称 并 UTF8
        const char *name = ivar_getName(ivar);
        NSString *keyName = [NSString stringWithUTF8String:name];
        // 归档
        [aCoder encodeObject:[self valueForKey:keyName] forKey:keyName];
    }
    // 释放内存 OC底层手动释放
    free(ivars);
}

// 解档
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        unsigned int count = 0;
        // 获取 .h 中属性的个数 -- count
        Ivar *ivars = class_copyIvarList([YFArcherCoder class], &count);
        for (int index = 0; index < count; index ++) {
            Ivar ivar = ivars[index];
            // 取出属性名称 并 UTF8
            const char *name = ivar_getName(ivar);
            NSString *keyName = [NSString stringWithUTF8String:name];
            // 解档
            id value = [coder decodeObjectForKey:keyName];
            // 设置到属性上
            [self setValue:value forKey:keyName];
        }
        // 释放内存 OC底层手动释放
        free(ivars);
    }
    return self;
}
@end
