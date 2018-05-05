//
//  YFSelectedTagViewController.m
//  YFToolsDemo
//
//  Created by apple on 2018/5/5.
//  Copyright © 2018年 BigShow. All rights reserved.
//

#import "YFSelectedTagViewController.h"
#import "YFSelectedTagView.h"
#import "CollectionViewCell.h"
#import "CollectionHeaderView.h"
#import "UICollectionViewLeftAlignedLayout.h"



@interface YFSelectedTagViewController ()
@property (nonatomic, strong) YFSelectedTagView *collectionView;
@end

@implementation YFSelectedTagViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UICollectionViewLeftAlignedLayout * layout = [[UICollectionViewLeftAlignedLayout alloc] init];
    CGRect collectionViewFrame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    self.collectionView = [[YFSelectedTagView alloc] initWithFrame:collectionViewFrame collectionViewLayout:layout];
    [self.view addSubview:self.collectionView];
    
    
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
