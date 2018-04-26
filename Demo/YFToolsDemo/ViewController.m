//
//  ViewController.m
//  YFToolsDemo
//
//  Created by apple on 2018/4/25.
//  Copyright © 2018年 BigShow. All rights reserved.
//

#import "ViewController.h"
#import "YFCommonTools.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self testSafeObject];
    
    [self testGloublTool];
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
    
    TARGET_IPHONE_SIMULATOR
    
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
