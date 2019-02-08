//
//  BtnCategoryViewController.m
//  YFToolsDemo
//
//  Created by big show on 2019/2/8.
//  Copyright © 2019年 BigShow. All rights reserved.
//

#import "BtnCategoryViewController.h"
#import "UIButton+Extension_yf.h"

@interface BtnCategoryViewController ()

@end

@implementation BtnCategoryViewController

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


@end
