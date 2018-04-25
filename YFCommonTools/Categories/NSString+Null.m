//
//  NSString+Null.m
//  QuanJieShopProject
//
//  Created by apple on 2018/1/30.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "NSString+Null.h"
//category
//可以在这个类下添加新的方法
@implementation NSString (Null)
//1.判断一个对象是否为空
static inline BOOL IfObjectIsEmpty (id objectThing){
    return objectThing == nil
    ||([objectThing isEqual:[NSNull null]])
    ||([objectThing respondsToSelector:@selector(length)] && [(NSData *)objectThing length] == 0)
    ||([objectThing respondsToSelector:@selector(count)]  && [(NSArray *)objectThing count] == 0);
}

//2.判断一个字符串是否为空
static inline BOOL IfStringIsEmpty (NSString *string){
    if (string == nil) {
        return YES;
    }
    
    if (string.length == 0) {
        return YES;
    }
    
    if ([string isEqualToString:@"<null>"]) {
        return YES;
    }
    
    if ([string isEqualToString:@"(null)"]) {
        return YES;
    }
    
    return NO;
}
//如果字符串为空则返回 ""
static inline NSString* StringIsEmpty (NSString *string){
    if (string == nil) {
        return @"";
    }
    
    if (string.length == 0) {
        return @"";
    }
    
    if ([string isEqualToString:@"<null>"]) {
        return @"";
    }
    
    if ([string isEqualToString:@"(null)"]) {
        return @"";
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return @"";
    }
    
    return string;
}
//赋值的时候调用这个方法
+ (NSString *)stringWithoutNilFormart:(NSString *)str{
    return [NSString stringWithFormat:@"%@",StringIsEmpty(str)];
}
@end
