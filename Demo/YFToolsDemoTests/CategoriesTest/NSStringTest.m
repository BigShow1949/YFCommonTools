//
//  NSStringTest.m
//  YFToolsDemoTests
//
//  Created by apple on 2018/5/2.
//  Copyright © 2018年 BigShow. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+Extension_YF.h"

@interface NSStringTest : XCTestCase

@end

@implementation NSStringTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testPinyin {
   
    // 拼音
    NSString *name = @"张三";
    NSString *pinyin = [name getPinYinFromString:name];
    XCTAssertTrue([pinyin isEqualToString:@"zhang san"]);
    
    NSString *name2 = @"李 四";
    NSString *pinyin2 = [name getPinYinFromString:name2];
    XCTAssertTrue([pinyin2 isEqualToString:@"li si"]);
    
    NSString *name3 = @" 王 五";
    NSString *pinyin3 = [name getPinYinFromString:name3];
    XCTAssertTrue([pinyin3 isEqualToString:@" wang wu"]);

}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
