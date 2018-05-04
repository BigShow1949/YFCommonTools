//
//  FOXFistViewController.m
//  FOXNavigationBar
//
//  Created by 徐惠雨 on 16/1/20.
//  Copyright © 2016年 XFoxer. All rights reserved.
//

#import "FOXFistViewController.h"
#import "FOXSecondViewController.h"
#import "UIViewController+FOXNavigationBar.h"

@interface FOXFistViewController ()


@end

@implementation FOXFistViewController


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
   
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self showBarTitleCoverView:[self createSegmentControl]];
    
}

/*
 * 分段:接机 && 送机
 */
- (UISegmentedControl *)createSegmentControl
{
    
    CGFloat controlWidth =  200.0f;
    CGFloat controlHeight = 35.0f;
    
    NSShadow *shadow = [NSShadow new];
    [shadow setShadowColor:[UIColor lightGrayColor]];
    [shadow setShadowOffset:CGSizeMake(0.01, 0.01)];
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor cyanColor],NSForegroundColorAttributeName, [UIFont systemFontOfSize:15],NSFontAttributeName ,shadow,NSShadowAttributeName ,nil];
    NSArray *segmentArr = [[NSArray alloc]initWithObjects:@"接机",@"送机", nil];
    UISegmentedControl *segmentControl = [[UISegmentedControl alloc]initWithItems:segmentArr];
    [segmentControl setTintColor:[UIColor purpleColor]];
    [segmentControl setSelectedSegmentIndex:0];
    [segmentControl setMultipleTouchEnabled:NO];
    [segmentControl setTitleTextAttributes:dic forState:UIControlStateNormal];
    [segmentControl addTarget:self action:@selector(controlSelect:) forControlEvents:UIControlEventValueChanged];
    [segmentControl setBounds:CGRectMake(0, 0, controlWidth, controlHeight)];
    
    return segmentControl;
    
}


- (void)controlSelect:(id)sender
{
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
