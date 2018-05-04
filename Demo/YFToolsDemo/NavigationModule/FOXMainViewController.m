
//
//  FOXMainViewController.m
//  FOXNavigationBar
//
//  Created by 徐惠雨 on 16/1/20.
//  Copyright © 2016年 XFoxer. All rights reserved.
//

#import "FOXMainViewController.h"

#import "UIViewController+FOXNavigationBar.h"

#import "FOXFistViewController.h"
#import "FOXSecondViewController.h"
#import "FOXThirdViewController.h"
#import "FOXFourthViewController.h"
#import "FOXFiveViewController.h"

@interface FOXMainViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, weak) UITableView *tableView;

@end

@implementation FOXMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"FOXNavigationBar";
    [self hiddenBarLine:YES];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self.view addSubview:self.tableView = [self createTableView]];
}



- (NSMutableArray *)dataArray
{
    NSMutableArray *data = [[NSMutableArray alloc]initWithObjects:@"自定义TitleView视图",@"自定义Items",@"禁止侧滑返回",@"隐藏导航栏",@"动态显示或隐藏导航栏", nil];
    return data;
}


- (NSMutableArray *)viewArray
{
    NSMutableArray *views = [[NSMutableArray alloc]initWithObjects:@"FOXFistViewController",@"FOXSecondViewController",
                             @"FOXThirdViewController",@"FOXFourthViewController",
                             @"FOXFiveViewController", nil];
    return views;
}



- (UITableView *)createTableView
{
    CGFloat navBarHeight = 64.0f;
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, navBarHeight, self.view.frame.size.width, self.view.frame.size.height - navBarHeight) style:UITableViewStyleGrouped];
    [tableView setDelegate:self];
    [tableView setDataSource:self];
    [tableView setMultipleTouchEnabled:YES];
    return tableView;
}


#pragma mark - UItableView Delegate && DataSource


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self dataArray].count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45.0f;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.00001f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.00001f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseIdentity = @"REUSE_IDENTITY";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentity];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentity];
    }
    
    NSString *title = [self dataArray][indexPath.row];
    [cell.textLabel setText:title];
    [cell.textLabel setTextColor:[UIColor brownColor]];
    
    return cell;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *viewNames = [self viewArray][indexPath.row];
    id className = [[NSClassFromString(viewNames) alloc]init];
    [self.navigationController pushViewController:className animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
