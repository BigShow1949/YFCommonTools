//
//  CategoryViewController.m
//  YFToolsDemo
//
//  Created by apple on 2018/5/8.
//  Copyright © 2018年 BigShow. All rights reserved.
//

#import "CategoryViewController.h"
#import "UIButton+Extension_yf.h"

@interface CategoryViewController ()

@end

@implementation CategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupDataArr:@[@[@"UIKit",@"UIKitCategoryViewController"],
                         @[@"Foundation",@"FoundationCategoryViewController"],
                         ]];
}


@end
