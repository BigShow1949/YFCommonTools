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
    
    { // 测试
        //*
        NSMutableArray * array1 = [@[@"推荐",@"热点",@"汽车",@"财经频道",@"热点",@"社会",@"明星八卦",@"IT科技",@"移动互联网",@"金融",@"大数据",@"股票期货",@"食品安全新闻",@"自定义标签"]mutableCopy];
        [self.collectionView.dataSourceArr addObject:array1];
        NSMutableArray * array2 = [@[@"推荐",@"热点",@"汽车",@"财经频道",@"热点",@"社会",@"明星八卦",@"IT科技",@"移动互联网",@"金融",@"大数据",@"股票期货",@"食品安全新闻食品食品安全"]mutableCopy];
        [self.collectionView.dataSourceArr addObject:array2];
        
        self.collectionView.titleArr = @[@"订阅", @"为订阅"];
        //*/
    }
    
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
