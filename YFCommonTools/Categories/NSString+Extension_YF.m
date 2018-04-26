//
//  NSString+Extension_YF.m
//  YFToolsDemo
//
//  Created by apple on 2018/4/25.
//  Copyright © 2018年 BigShow. All rights reserved.
//

#import "NSString+Extension_YF.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Extension_YF)

#pragma mark - emoji表情
+ (BOOL)stringContainsEmoji:(NSString *)string{
    __block BOOL returnValue = NO;
    
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length])
                               options:NSStringEnumerationByComposedCharacterSequences
                            usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                const unichar hs = [substring characterAtIndex:0];
                                if (0xd800 <= hs && hs <= 0xdbff) {
                                    if (substring.length > 1) {
                                        const unichar ls = [substring characterAtIndex:1];
                                        const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                                        if (0x1d000 <= uc && uc <= 0x1f77f) {
                                            returnValue = YES;
                                        }
                                    }
                                } else if (substring.length > 1) {
                                    const unichar ls = [substring characterAtIndex:1];
                                    if (ls == 0x20e3) {
                                        returnValue = YES;
                                    }
                                } else {
                                    if (0x2100 <= hs && hs <= 0x27ff) {
                                        returnValue = YES;
                                    } else if (0x2B05 <= hs && hs <= 0x2b07) {
                                        returnValue = YES;
                                    } else if (0x2934 <= hs && hs <= 0x2935) {
                                        returnValue = YES;
                                    } else if (0x3297 <= hs && hs <= 0x3299) {
                                        returnValue = YES;
                                    } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                                        returnValue = YES;
                                    }
                                }
                            }];
    
    return returnValue;
}

//判断是否为空有空格和回车
+ (BOOL)isNilForText:(NSString *)string {
    NSRegularExpression *regularexpression = [[NSRegularExpression alloc]
                                              initWithPattern:@"^[\\s]*$"
                                              options:NSRegularExpressionCaseInsensitive
                                              error:nil];
    NSUInteger numberofMatch = [regularexpression numberOfMatchesInString:string
                                                                  options:NSMatchingReportProgress
                                                                    range:NSMakeRange(0, string.length)];
    
    if(numberofMatch > 0)
    {
        NSLog(@"%@ isNumbericString: YES", string);
        return YES;
    }
    NSLog(@"%@ isNumbericString: NO", string);
    return NO;
}

#pragma mark - 空字符串判断
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
#pragma mark - 时间转换 (少了对self的判断)
- (NSString *)changeToYearSec {  // 2016-06-22 14:11:57
    NSLog(@"time = %@", self);
    
    //    if (self.length != 19) {
    //        return @"error";
    //    }
    NSString * _year = [self substringWithRange:NSMakeRange(0, 4)];
    NSString * _month = [self substringWithRange:NSMakeRange(5, 2)];
    NSString * _day = [self substringWithRange:NSMakeRange(8, 2)];
    NSString * _hour = [self substringWithRange:NSMakeRange(11,2)];
    NSString * _min = [self substringWithRange:NSMakeRange(14, 2)];
    NSString * _sec = [self substringWithRange:NSMakeRange(17, 2)];
    
    NSString *resStr = [NSString stringWithFormat:@"%@年%@月%@日 %@:%@:%@", _year, _month, _day, _hour, _min, _sec];
    return resStr;
}

- (NSString *)changeToYearMin {
    //    if (self.length != 19) {
    //        return @"error";
    //    }
    NSString * _year = [self substringWithRange:NSMakeRange(0, 4)];
    NSString * _month = [self substringWithRange:NSMakeRange(5, 2)];
    NSString * _day = [self substringWithRange:NSMakeRange(8, 2)];
    NSString * _hour = [self substringWithRange:NSMakeRange(11,2)];
    NSString * _min = [self substringWithRange:NSMakeRange(14, 2)];
    
    NSString *resStr = [NSString stringWithFormat:@"%@年%@月%@日 %@:%@", _year, _month, _day, _hour, _min];
    return resStr;
}

- (NSString *)changeToYearDay {
    //    if (self.length != 19) {
    //        return @"error";
    //    }
    NSString * _year = [self substringWithRange:NSMakeRange(0, 4)];
    NSString * _month = [self substringWithRange:NSMakeRange(5, 2)];
    NSString * _day = [self substringWithRange:NSMakeRange(8, 2)];
    
    
    NSString *resStr = [NSString stringWithFormat:@"%@年%@月%@日", _year, _month, _day];
    return resStr;
}


- (NSString *)changeToYearMonth {
    //    if (self.length != 19) {
    //        return @"error";
    //    }
    //    NSLog(@"self = %@", self);
    NSString * _year = [self substringWithRange:NSMakeRange(0, 4)];
    NSString * _month = [self substringWithRange:NSMakeRange(5, 2)];
    
    NSString *resStr = [NSString stringWithFormat:@"%@年%@月", _year, _month];
    return resStr;
}

- (NSString *)changeToMonthDay {
    NSString * _month = [self substringWithRange:NSMakeRange(5, 2)];
    NSString * _day = [self substringWithRange:NSMakeRange(8, 2)];
    
    NSString *resStr = [NSString stringWithFormat:@"%@月%@日", _month, _day];
    return resStr;
}

- (NSString *)getMonthStr {
    
    //    NSLog(@"self = %@", self);
    //    NSString * _year = [self substringWithRange:NSMakeRange(0, 4)];
    NSString * _month = [self substringWithRange:NSMakeRange(5, 2)];
    return _month;
}

- (NSString *)getYearStr {
    
    NSString * _year = [self substringWithRange:NSMakeRange(0, 4)];
    return _year;
}


- (NSString *)getDayStr {   // 2016-06-22 14:11:57
    NSString * _day = [self substringWithRange:NSMakeRange(8, 2)];
    return _day;
}
#pragma mark - 正则表达式判断
//验证手机号码
- (BOOL)validateMobilePhone
{
    NSString *phoneRegex = @"^(13[0-9]|14[5|7]|15[0-9]|18[0-9])\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [phoneTest evaluateWithObject:self];
}

//验证固定电话号码
- (BOOL)validateTelePhone
{
    NSString *phoneRegex = @"(\\d{3}-|\\d{4}-)?(\\d{8}|\\d{7})?";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [phoneTest evaluateWithObject:self];
}

//非负整数
- (BOOL)validateUnsignedInt
{
    NSString *stringRegex = @"^\\d+$";
    NSPredicate *stringTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", stringRegex];
    return [stringTest evaluateWithObject:self];
}

//普通字符串，字母数字汉字和空格
- (BOOL)validateNormalString
{
    NSString *stringRegex = @"^[ |0-9a-zA-Z\u4e00-\u9fa5]*$";
    NSPredicate *stringTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", stringRegex];
    return [stringTest evaluateWithObject:self];
}

//普通字符串，字母数字 密码
- (BOOL)validatePassowrdString
{
    NSString *stringRegex = @"^[0-9a-zA-Z]*$";
    NSPredicate *stringTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", stringRegex];
    return [stringTest evaluateWithObject:self];
}

//空格或汉字字符串
- (BOOL)validateChineseString
{
    NSString *stringRegex = @"^[ |\u4e00-\u9fa5]*$";
    NSPredicate *stringTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", stringRegex];
    return [stringTest evaluateWithObject:self];
}

//邮箱
- (BOOL)validateEMail
{
    NSString *emailRegex = @"^[a-zA-Z0-9_\\.]*@[a-zA-Z0-9_\\.]+(\\.[[a-zA-Z0-9_\\.]{2,4}]+)+$";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

// MD5转成字符串
- (NSString *) stringFromMD5{
    
    if(self == nil || [self length] == 0)
        return nil;
    
    const char *value = [self UTF8String];
    // extern unsigned char *CC_MD5(const void *data, CC_LONG len, unsigned char *md)

    unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(value, (unsigned int)strlen(value), outputBuffer);
    
    NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++){
        [outputString appendFormat:@"%02x",outputBuffer[count]];
    }
    
    return outputString;
}

//MD5大写字母串
- (NSString *)md5UppercaseStringUsingEncoding:(NSStringEncoding)encoding
{
    unsigned char result[32];
    //
    const char *cString = [self cStringUsingEncoding:encoding];
    CC_MD5(cString, (CC_LONG)strlen(cString), result);
    NSMutableString *mstrMD5String = [NSMutableString string];
    for (int i = 0; i < 16; i++) {
        [mstrMD5String appendFormat:@"%02X", result[i]];
    }
    return mstrMD5String;
}

//MD5小写字母串
- (NSString *)md5LowercaseStringUsingEncoding:(NSStringEncoding)encoding
{
    unsigned char result[32];
    //
    const char *cString = [self cStringUsingEncoding:encoding];
    CC_MD5(cString, (CC_LONG)strlen(cString), result);
    NSMutableString *mstrMD5String = [NSMutableString string];
    for (int i = 0; i < 16; i++) {
        [mstrMD5String appendFormat:@"%02x", result[i]];
    }
    return mstrMD5String;
}

+ (NSString *)cutoffStr:(NSString *)str { // 号码当中四个数字变为*
    if (str.length != 11) {
        return @"";
    }
    NSMutableString *strMutable = [NSMutableString stringWithString:str];
    [strMutable replaceCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
    return strMutable;
    
}

#pragma mark - 缓存路径
- (NSString *)cacheDir {
    NSString *dir = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    return [dir stringByAppendingPathComponent:[self lastPathComponent]];
}

- (NSString *)documentDir {
    NSString *dir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    return [dir stringByAppendingPathComponent:[self lastPathComponent]];
}

- (NSString *)tmpDir {
    NSString *dir = NSTemporaryDirectory();
    return [dir stringByAppendingPathComponent:[self lastPathComponent]];
}

#pragma mark - base64加密解密

- (NSString *)base64EncodeStr:(NSString *)str {
    
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    
    return [data base64EncodedStringWithOptions:0];
    
}

- (NSString *)base64DecodeStr:(NSString *)str {
    
    NSData *data = [[NSData alloc] initWithBase64EncodedString:str options:0];
    
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
}

#pragma mark - 计算文件大小
- (NSInteger)fileSize
{
    NSFileManager *mgr = [NSFileManager defaultManager];
    // 判断是否为文件
    BOOL dir = NO;
    BOOL exists = [mgr fileExistsAtPath:self isDirectory:&dir];
    // 文件\文件夹不存在
    if (exists == NO) return 0;
    
    if (dir) { // self是一个文件夹
        // 遍历caches里面的所有内容 --- 直接和间接内容
        NSArray *subpaths = [mgr subpathsAtPath:self];
        NSInteger totalByteSize = 0;
        for (NSString *subpath in subpaths) {
            // 获得全路径
            NSString *fullSubpath = [self stringByAppendingPathComponent:subpath];
            // 判断是否为文件
            BOOL dir = NO;
            [mgr fileExistsAtPath:fullSubpath isDirectory:&dir];
            if (dir == NO) { // 文件
                totalByteSize += [[mgr attributesOfItemAtPath:fullSubpath error:nil][NSFileSize] integerValue];
            }
        }
        return totalByteSize;
    } else { // self是一个文件
        return [[mgr attributesOfItemAtPath:self error:nil][NSFileSize] integerValue];
    }
}

@end
