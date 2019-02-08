//
//  NSString+Extension_yf.m
//  YFToolsDemo
//
//  Created by apple on 2018/4/25.
//  Copyright © 2018年 BigShow. All rights reserved.
//

#import "NSString+Extension_yf.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Extension_yf)

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
+ (NSString *)stringWithoutNilFormart:(NSString *)str{
    if ([str isKindOfClass:[NSNull class]]) return @"";
    if (str == nil) return @"";
    if (str.length == 0) return @"";
    if ([str isEqualToString:@"(null)"]) return @"";
    if ([str isEqualToString:@"<null>"]) return @"";
   
    str = [str stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
     if (str.length == 0) {
         return @"";
     }
     return str;
}
#pragma mark - 时间转换 (少了对self的判断)

#pragma mark -- 22.时间戳转字符串(获取的时间距离现在多少)
+ (NSString *)timeSinceNow: (NSString *) theDate{
    NSDateFormatter *date=[[NSDateFormatter alloc] init];
    [date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *d=[date dateFromString:theDate];
    NSTimeInterval late=[d timeIntervalSince1970]*1;
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval now=[dat timeIntervalSince1970]*1;
    NSString *timeString=@"";
    NSTimeInterval cha=now-late;
    if (cha/3600<1) {
        //    发表在一小时之内
        if (cha/60<1) {
            timeString = @"1";
        }else{
            timeString = [NSString stringWithFormat:@"%f", cha/60];
            timeString = [timeString substringToIndex:timeString.length-7];
        }
        timeString=[NSString stringWithFormat:@"%@分钟前", timeString];
    }else if (cha/3600>1&&cha/86400<1) {
        //    在一小时以上24小以内
        timeString = [NSString stringWithFormat:@"%f", cha/3600];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"%@小时前", timeString];
    }else if (cha/86400>1&&cha/864000<1){
        //    发表在24以上10天以内
        timeString = [NSString stringWithFormat:@"%f", cha/86400];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"%@天前", timeString];
    }else{
        //    发表时间大于10天
        //        timeString = [NSString stringWithFormat:@"%d-%"]
        NSArray *array = [theDate componentsSeparatedByString:@" "];
        //        return [array objectAtIndex:0];
        timeString = [array objectAtIndex:0];
    }
    return timeString;
}

#pragma mark -- 36.时间戳转换成指定格式(@"yyyy-MM-dd HH:mm:ss",@"yyyy-MM-dd")
+ (NSString *)timeChange:(NSString *)time withFormatter:(NSString *)matter{
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:matter];
    // 毫秒值转化为秒要除以1000
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[time doubleValue]/ 1];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}

#pragma mark -- 39.时间差(当前时间到结束时间的时间差)
+ (NSString *)dateTimeDifferenceWithEndtime:(NSString *)endtime{
    NSDateFormatter *date = [[NSDateFormatter alloc]init];
    [date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate* startD = [NSDate dateWithTimeIntervalSinceNow:0];
    NSDate *endD = [date dateFromString:endtime];
    NSTimeInterval start = [startD timeIntervalSince1970]*1;
    NSTimeInterval end = [endD timeIntervalSince1970]*1;
    NSTimeInterval value = end - start;
    //int second = (int)value %60;//秒
    //int minute = (int)value /60%60;
    //int house = (int)value / (24 *3600)%3600;
    //int day = (int)value / (24 *3600);
    NSString *str;
    //    if (second < 0) {
    //        second = -second;
    //    }
    str = [NSString stringWithFormat:@"%d",(int)value];
    //    if (day != 0) {
    //        str = [NSString stringWithFormat:@"耗时%d天%d小时%d分%d秒",day,house,minute,second];
    //    }else if (day==0 && house !=0) {
    //        str = [NSString stringWithFormat:@"耗时%d小时%d分%d秒",house,minute,second];
    //    }else if (day==0 && house==0 && minute!=0) {
    //        str = [NSString stringWithFormat:@"%d分%d秒",minute,second];
    //    }else{
    //        str = [NSString stringWithFormat:@"耗时%d秒",second];
    //    }
    return str;
}

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
//验证纯字母
- (BOOL)validateAllLetter {
    NSString *regex = @"[a-zA-Z]*";  // 字母或者数字 @"[a-zA-Z0-9]*";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if ([pred evaluateWithObject:self]) {
        return YES;
    }
    return NO;
}
//验证纯数字
- (BOOL)validateAllNumber {
    NSString *regex = @"[0-9]*";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if ([pred evaluateWithObject:self]) {
        return YES;
    }
    return NO;
}
//验证银行卡
- (BOOL)validateBandCard {
    int oddSum = 0;     // 奇数和
    int evenSum = 0;    // 偶数和
    int allSum = 0;     // 总和
    for (NSInteger i = 1; i <= self.length; i++) {  // 循环加和
        NSString *theNumber = [self substringWithRange:NSMakeRange(self.length-i, 1)];
        int lastNumber = [theNumber intValue];
        if (i%2 == 0) { // 偶数位
            lastNumber *= 2;
            if (lastNumber > 9) {
                lastNumber -=9;
            }
            evenSum += lastNumber;
        } else{ // 奇数位
            oddSum += lastNumber;
        }
    }
    allSum = oddSum + evenSum;
    if (allSum%10 == 0) { // 是否合法
        return YES;
    }else {
        return NO;
    }
}
//验证身份证
- (BOOL)validateIDCard {
    if (self.length <= 0) {
        return NO;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:self];
}
//验证手机号码
- (BOOL)validateMobilePhone {
    // @"^(13[0-9]|14[5|7]|15[0-9]|18[0-9])\\d{8}$" 不需要匹配的这么细
    NSString *pattern = @"^1[34578]\\d{9}$";
    NSError *error = nil;
    NSRegularExpression *rge = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
    NSAssert(error == nil,@"正则表达式创建失败:%@",error);
    //  通过正则表达式匹配字符
    NSTextCheckingResult *rs = [rge firstMatchInString:self options:0 range:NSMakeRange(0, self.length)];
    
    if (rs != nil && self.length == 11) {
        return YES;
    }else{
        return NO;
    }
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

#pragma mark - 汉语转拼音
- (NSString *)getPinYinFromString:(NSString *)string{
    CFMutableStringRef aCstring = CFStringCreateMutableCopy(NULL, 0, (__bridge_retained CFStringRef)string);
    
    /**
     *  创建可变CFString
     *
     *  @param NULL 使用默认创建器
     *  @param 0    长度不限制
     *  @param "张三" cf字串
     *
     *  @return 可变字符串
     */
    
    /**
     *  1. string: 要转换的字符串(可变的)
     2. range: 要转换的范围 NULL全转换
     3. transform: 指定要怎样的转换
     4. reverse: 是否可逆的转换
     */
    CFStringTransform(aCstring, NULL, kCFStringTransformMandarinLatin, NO);
    
    CFStringTransform(aCstring, NULL, kCFStringTransformStripDiacritics, NO);
    
    return [NSString stringWithFormat:@"%@",aCstring];
}

@end
