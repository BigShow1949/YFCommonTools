//
//  YFToolsDemoTests.m
//  YFToolsDemoTests
//
//  Created by apple on 2018/4/28.
//  Copyright © 2018年 BigShow. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface YFToolsDemoTests : XCTestCase

@end

@implementation YFToolsDemoTests

- (void)setUp {
    [super setUp];
    //初始化的代码，在测试方法调用之前调用
}

- (void)tearDown {
    // 释放测试用例的资源代码，这个方法会每个测试用例执行后调用
    [super tearDown];
}

- (void)testExample {
   // 测试用例的例子，注意测试用例一定要test开头
}

- (void)testPerformanceExample {
    // 测试性能例子
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        // 需要测试性能的代码
    }];
}

@end
