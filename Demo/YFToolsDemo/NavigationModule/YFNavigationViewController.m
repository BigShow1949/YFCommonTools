//
//  YFNavigationViewController.m
//  YFToolsDemo
//
//  Created by big show on 2019/3/27.
//  Copyright © 2019年 BigShow. All rights reserved.
//

#import "YFNavigationViewController.h"
#import "FOXMainViewController.h"
#import "YFNavigationViewController_yf.h"
@interface YFNavigationViewController ()

@end

@implementation YFNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self navigationTest];
}

- (void)navigationTest {
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 100, 60, 55)];
    [btn setTitle:@"导航栏" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(naviClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)naviClick {
    NSLog(@"==========点击导航栏");
    FOXMainViewController *mainVC = [[FOXMainViewController alloc] init];
    
    YFNavigationViewController_yf *navi = [[YFNavigationViewController_yf alloc] initWithRootViewController:mainVC];
    //    [self.navigationController pushViewController:navi animated:YES];
    [self presentViewController:navi animated:YES completion:nil];
}

@end
