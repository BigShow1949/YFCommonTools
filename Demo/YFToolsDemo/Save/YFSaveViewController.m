//
//  YFSaveViewController.m
//  YFToolsDemo
//
//  Created by big show on 2019/3/27.
//  Copyright © 2019年 BigShow. All rights reserved.
//

#import "YFSaveViewController.h"
#import "YFSaveTool.h"

#import "YFPerson.h"
#import "YFStudent.h"

@interface YFSaveViewController ()

@end

@implementation YFSaveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testArcherTool];
    [self testSaveTool];
}

- (void)testArcherTool {
    // 增加测试数据  person
    NSMutableDictionary *testDic = [NSMutableDictionary dictionary];
    // 姓名 年龄 性别 爱好
    [testDic setObject:@"张三" forKey:@"testName"];
    [testDic setObject:@"23"  forKey:@"testAge"];
    [testDic setObject:@"男" forKey:@"testSex"];
    [testDic setObject:@"打游戏" forKey:@"testHabby"];
    
    // 存储数据
    [YFArcherModel saveAction:testDic];
    // 取出数据
    YFArcherCoder *coder = [YFArcherModel takeAction];
    NSLog(@"\n姓名:%@\n年龄:%@\n性别:%@\n爱好:%@", coder.dict[@"testAge"], coder.dict[@"testName"], coder.dict[@"testSex"], coder.dict[@"testHabby"]);
    
    
    // 存储模型
    YFPerson *person = [[YFPerson alloc] init];
    person.name = @"李四";
    person.age = 22;
    [person archiveWithName:@"YFPerson"];
    
    YFPerson *person2 = [YFPerson unArchiveWithName:@"YFPerson"];
    NSLog(@"name = %@", person2.name);
    NSLog(@"age = %ld", (long)person2.age);
    
    // 存储字典
    [testDic archiveWithName:@"dict"];
    
    NSDictionary *dict2 = [NSDictionary unArchiveWithName:@"dict"];
    NSLog(@"dict2 = %@", dict2);
    NSLog(@"dict2.class = %@", [dict2 class]);
    
    NSLog(@"testName = %@", dict2[@"testName"]);
    NSLog(@"testAge = %@", dict2[@"testAge"]);
    
    //    YFArcherCoder *coder2 = [YFArcherModel takeAction];
    //    NSLog(@"dict = %@", coder2.dict);
    
}

- (void)testSaveTool {
    NSString *str = [YFSaveTool getSystemPath:SystemPathType_Document];
    NSLog(@"str = %@", str);
    [YFSaveTool savePlist:@"hehe" localPath:str];
    
    id result = [YFSaveTool readPlist:str];
    NSLog(@"[result class] = %@", [result class]);
    NSLog(@"result = %@", result);
}


@end
