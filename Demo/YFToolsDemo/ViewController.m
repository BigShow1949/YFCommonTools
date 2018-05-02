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
#import "YFStudent.h"

#import <CoreData/CoreData.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self testSafeObject];
    
//    [self testGloublTool];
    
//    [self testArcherTool];
    
//    [self testSaveTool];
    
    NSString *name = @"张 三";
    NSString *pinyin = [name getPinYinFromString:name];
    [self testCoreData];
}

- (void)testCoreData {
//    //表格结构：NSEntityDescription 相当于数据库中的一个表，TA描述一种抽象数据类型
//    //+insertNewObjectForEntityForName:inManagedObjectContext: 工厂方法，根据给定的 Entity 描述，生成相应的 NSManagedObject 对象，并插入到 ManagedObjectContext 中
//    NSManagedObjectContext *managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSConfinementConcurrencyType];
//    YFStudent *student = [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:managedObjectContext];
//    //通过上面的代码可以得到student这个表的实例，然后可以使用这个实例去为表中的属性赋值
//    student.name = @"like";
//    student.age = 12;
    
    
    
    // 应用程序的数据模型，数据库中所有表格和他们之间的联系：NSManagedObjectModel
    // 系统会读取model文件来声称NSManagedObjectModel对象，
    // model ：对于class,model称之为 entity; 对于instant variable, model 称之为property
    // model包含两种property: attributes 和 relationships. attribute为简单数据类型,如一个字符串,日期,数字
    
//    NSManagedObjectModel   * model    = [self managedObjectModel];//获取实例
//    NSDictionary           * entities = [model entitiesByName];//entitiesByName 得到所有的表的名字
//    NSEntityDescription    * entity   = [entities valueForKey:@"Student"];//从里面找出名为 Student 的表
    
    
}

- (void)testSaveTool {
    NSString *str = [YFSaveTool getSystemPath:SystemPathType_Document];
    NSLog(@"str = %@", str);
    [YFSaveTool savePlist:@"hehe" localPath:str];
    
    id result = [YFSaveTool readPlist:str];
    NSLog(@"[result class] = %@", [result class]);
    NSLog(@"result = %@", result);
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
    NSLog(@"age = %d", person2.age);
    
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
