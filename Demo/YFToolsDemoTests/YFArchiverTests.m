//
//  YFArchiverTests.m
//  YFToolsDemoTests
//
//  Created by apple on 2018/4/28.
//  Copyright © 2018年 BigShow. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "YFArchiverManager.h"
#import "NSObject+Archiver.h"
#import "YFPersonTest.h"

@interface YFArchiverTests : XCTestCase

@end

@implementation YFArchiverTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

// 测试归档/解档
- (void)testArchiverAndUnArchiver {
    YFPersonTest *person = [YFPersonTest new];
    
    person.str = @"str";
    
    NSMutableString *muStr = [NSMutableString stringWithString:person.str];
    person.muStr = muStr;
    
    person.dic = @{@"key":@"value"};
    
    NSMutableDictionary *muDic = [NSMutableDictionary dictionaryWithDictionary:person.dic];
    person.muDic = muDic;
    
    person.arr = @[@"arr1",@"arr2"];
    
    NSMutableArray *muArr = [NSMutableArray arrayWithArray:person.arr];
    person.muArr = muArr;
    
    person.data = [person.str dataUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableData *muData = [NSMutableData dataWithData:person.data];
    person.muData = muData;
    
    person.set = [NSSet setWithObjects:@"1",@"2",@"3",nil];
    
    NSMutableSet *muSet = [NSMutableSet setWithSet:person.set];
    person.muSet = muSet;
    
    person.w_float = 1.1;
    person.w_doule = 2.2;
    person.w_cgfloat = 3.3;
    person.w_int = 4;
    person.w_integer = 5;
    person.w_uinteger = 6;
    person.w_bool = YES;
    
    Student *student = [Student new];
    student.name = @"wzx";
    student.age = 23;
    
    person.student = student;
    
    BOOL isHave = [YFPersonTest archiveWithName:@"person"];
    NSAssert(isHave = YES, @"归档失败");
    
    YFPersonTest *person2 = [YFPersonTest unArchiveWithName:@"person"];
    
    XCTAssertTrue([person2.str isEqualToString: [muStr copy]]);
    XCTAssertTrue([person2.muStr isEqual: muStr]);
    
    XCTAssertTrue([person2.dic isEqual: [muDic copy]]);
    XCTAssertTrue([person2.muDic isEqual:muDic]);
    
    XCTAssertTrue([person2.arr isEqual: [muArr copy]]);
    XCTAssertTrue([person2.muArr isEqual: muArr]);
    
    XCTAssertTrue([person2.data isEqual: [muData copy]]);
    XCTAssertTrue([person2.muData isEqual: muData]);
    
    XCTAssertTrue([person2.set isEqual: [muSet copy]]);
    XCTAssertTrue([person2.muSet isEqual: muSet]);
    
    XCTAssertTrue([person2.arr isEqual: [muArr copy]]);
    XCTAssertTrue([person2.muArr isEqual: muArr]);
    
    XCTAssertTrue(person2.w_float == person.w_float);
    XCTAssertTrue(person2.w_doule == person.w_doule);
    XCTAssertTrue(person2.w_cgfloat == person.w_cgfloat);
    XCTAssertTrue(person2.w_int == 4);
    XCTAssertTrue(person2.w_integer == 5);
    XCTAssertTrue(person2.w_uinteger == 6);
    XCTAssertTrue(person2.w_bool == YES);
    
    XCTAssertTrue([person2.student.name isEqualToString: person.student.name]);
    XCTAssertTrue(person2.student.age == person.student.age);
    
}

- (void)testArchiverManager {
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
