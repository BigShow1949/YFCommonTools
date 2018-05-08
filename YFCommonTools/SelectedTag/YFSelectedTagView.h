//
//  YFSelectedTagView.h
//  YFToolsDemo
//
//  Created by apple on 2018/5/5.
//  Copyright © 2018年 BigShow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YFSelectedTagView : UICollectionView
@property (nonatomic, strong) NSMutableArray *dataSourceArr;
@property (nonatomic, strong) NSMutableArray *titleArr;

@property (nonatomic, strong) NSMutableArray *selectedArr;

@property (nonatomic, copy) void (^didSelectedBlock)(NSMutableArray *selectedArr);

@end
