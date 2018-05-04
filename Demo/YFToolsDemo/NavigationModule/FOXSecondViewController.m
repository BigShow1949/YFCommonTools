


//
//  FOXSecondViewController.m
//  FOXNavigationBar
//
//  Created by 徐惠雨 on 16/1/20.
//  Copyright © 2016年 XFoxer. All rights reserved.
//

#import "FOXSecondViewController.h"
#import "FOXFistViewController.h"

#import "UIViewController+FOXNavigationBar.h"


@interface FOXSecondViewController ()

@end

@implementation FOXSecondViewController



- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}


- (void)loadView
{
    [super loadView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self setTitle:@"SECONDS"];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self createItemBtn];
}


- (void)createItemBtn
{
    
    CGFloat bWidth = 40.0f;
    CGFloat bGap = 5.0f;
    CGFloat itemPosX = self.view.frame.size.width - 3*bGap - bWidth*3;
    CGFloat itemPosY = 20.0f + (44.0f - 40.0f)/2;
    for (NSUInteger i = 0; i < 3; i ++ ) {
        
        UIButton *itemBtn = [[UIButton alloc]initWithFrame:CGRectMake(itemPosX + (bWidth + bGap)*i, itemPosY, bWidth, bWidth)];
        [itemBtn setBackgroundColor:[UIColor cyanColor]];
        [itemBtn setTintColor:[UIColor whiteColor]];
        [itemBtn setTag:1 + i];
        [itemBtn setTitle:[NSString stringWithFormat:@"%@",@(i + 1)] forState:UIControlStateNormal];
        [itemBtn addTarget:self action:@selector(navBarItemClick:) forControlEvents:UIControlEventTouchUpInside];
        [self showBarCoverView:itemBtn];

    }
    
}

- (void)navBarItemClick:(UIButton *)btn
{
    
    NSString *message = [NSString stringWithFormat:@"点击了第%@个Item",@(btn.tag)];
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"" message:message delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
    [alertView show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
