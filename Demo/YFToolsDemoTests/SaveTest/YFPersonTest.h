//
//  YFPersonTest.h
//  YFToolsDemoTests
//
//  Created by apple on 2018/4/28.
//  Copyright © 2018年 BigShow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class Student;

@interface YFPersonTest : NSObject
@property (nonatomic, copy) NSString *str;
@property (nonatomic, strong) NSMutableString *muStr;
@property (nonatomic, copy) NSArray *arr;
@property (nonatomic, strong) NSMutableArray *muArr;
@property (nonatomic, copy) NSDictionary *dic;
@property (nonatomic, strong) NSMutableDictionary *muDic;
@property (nonatomic, copy) NSData *data;
@property (nonatomic, strong) NSMutableData *muData;
@property (nonatomic, copy) NSSet *set;
@property (nonatomic, strong) NSMutableSet *muSet;

@property (nonatomic, assign) NSInteger w_integer;
@property (nonatomic, assign) NSUInteger w_uinteger;
@property (nonatomic, assign) CGFloat w_cgfloat;
@property (nonatomic, assign) BOOL w_bool;
@property (nonatomic, assign) int w_int;
@property (nonatomic, assign) double w_doule;
@property (nonatomic, assign) float w_float;

@property (nonatomic, strong) Student *student;
@end

@interface Student: NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;

@end

