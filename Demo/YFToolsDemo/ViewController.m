//
//  ViewController.m
//  YFToolsDemo
//
//  Created by apple on 2018/4/25.
//  Copyright © 2018年 BigShow. All rights reserved.
//

#import "ViewController.h"
#import "YFCommonTools.h"

#import "YFPerson.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self testSafeObject];
    
//    [self testGloublTool];
    
    [self testSaveTool];
}

- (void)testSaveTool {
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
    
    
//    YFPerson *person = [[YFPerson alloc] init];
//    person.name = @"李四";
//    person.age = @"22";
//    [YFArcherModel saveAction:person];
//
//    YFArcherCoder *coder2 = [YFArcherModel takeAction];
//    NSLog(@"dict = %@", coder2.dict);

}

- (void)testGloublTool {
    
    if (IS_iOS11Later) {
        NSLog(@"====================  ios11以后");
    }else if (IS_iOS10Later){
        NSLog(@"====================  ios10以后");
    }else if (IS_iOS9Later){
        NSLog(@"====================  ios9以后");
    }else if (IS_iOS8Later){
        NSLog(@"====================  ios8以后");
    }
    
}

- (void)testSafeObject {
    // 测试数组
    NSArray *arr = @[@"1",@"2",@"2",@"2",@"2",@"2",@"2",@"2",@"2"];
    NSMutableArray *tableArray = [[NSMutableArray alloc] initWithArray:arr];
    NSLog(@"arr====%@   tableArray====%@",arr[100],tableArray[100]);
    NSLog(@"arr====%@   tableArray====%@",[arr objectAtIndex:100],tableArray[100]);
    
    // 测试字典
    NSDictionary *dict = @{@"name":@"",@"age":@"20"};
    NSMutableDictionary *tableDict = [[NSMutableDictionary alloc] initWithDictionary:dict];
    NSLog(@"dict---name====%@   tableDict---age====%@",[dict objectForKey:@"name"],[tableDict objectForKey:@"age"]);
    NSLog(@"dict---name====%@   tableDict---age====%@",[dict objectForKey:@"name"],[tableDict objectForKey:@"age"]);
    
    // 测试字符串
    NSMutableString *tableString = [[NSMutableString alloc] initWithFormat:@"防止项目数组字典越界崩溃"];
    NSLog(@"%@",[tableString substringFromIndex:100]);
}

@end
