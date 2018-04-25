//
//  NSString+file.m
//  SinaNews
//
//  Created by 王海军 on 14/12/22.
//  Copyright (c) 2014年 HJ. All rights reserved.
//

#import "NSString+Time.h"
@interface NSString ()
//{
//    NSString *_year;
//    NSString *_month;
//    NSString *_day;
//    NSString *_hour;
//    NSString *_min;
//    NSString *_sec;
//}


@end

@implementation NSString (Time)

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


@end
