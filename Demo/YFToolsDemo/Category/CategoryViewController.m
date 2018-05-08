//
//  CategoryViewController.m
//  YFToolsDemo
//
//  Created by apple on 2018/5/8.
//  Copyright © 2018年 BigShow. All rights reserved.
//

#import "CategoryViewController.h"
#import "UIButton+Extension_YF.h"

@interface CategoryViewController ()

@end

@implementation CategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:@"文字" forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"kaidian"] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor lightGrayColor];
    btn.frame = CGRectMake(50, 100, 80, 80);
    // 这行要在frame设置之后才有效
    [btn layoutButtonWithEdgeInsetsStyle:LLButtonStyleTextBottom imageTitleSpace:5];
    [self.view addSubview:btn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
