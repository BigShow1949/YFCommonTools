//
//  FOXFiveViewController.m
//  FOXNavigationBar
//
//  Created by 徐惠雨 on 16/1/23.
//  Copyright © 2016年 XFoxer. All rights reserved.
//

#import "FOXFiveViewController.h"
#import "UIViewController+FOXNavigationBar.h"

@interface FOXFiveViewController ()

@end

@implementation FOXFiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitle:@"AnimatedBar"];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self createBarAnimatedBtn];
}


- (void)createBarAnimatedBtn
{
    CGFloat bWidth = 100.0f;
    CGFloat bHeight = 45.0f;
    UIButton *itemBtn = [[UIButton alloc]init];
    [itemBtn setBounds:CGRectMake(0, 0, bWidth, bHeight)];
    [itemBtn setCenter:CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/3)];
    [itemBtn setBackgroundColor:[UIColor cyanColor]];
    [itemBtn setTintColor:[UIColor whiteColor]];
    [itemBtn setTitle:[NSString stringWithFormat:@"显示或隐藏"] forState:UIControlStateNormal];
    [itemBtn addTarget:self action:@selector(itemBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:itemBtn];
}


- (void)itemBtnClick:(UIButton *)btn
{
    
    if (!btn.selected) {
        [btn setSelected:YES];
        [self hiddenBarWithAnimation:YES];
    }
    else
    {
        [btn setSelected:NO];
        [self hiddenBarWithAnimation:NO];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
