//
//  YFSelectedTagView.m
//  YFToolsDemo
//
//  Created by apple on 2018/5/5.
//  Copyright © 2018年 BigShow. All rights reserved.
//
#import "CollectionViewCell.h"
#import "YFSelectedTagView.h"
#import "CollectionHeaderView.h"
#import "UICollectionViewLeftAlignedLayout.h"

#define kControllerHeaderViewHeight                90
#define kControllerHeaderToCollectionViewMargin    0
#define kCollectionViewCellsHorizonMargin          12
#define kCollectionViewCellHeight                  30
#define kCollectionViewItemButtonImageToTextMargin 5

#define kCollectionViewToLeftMargin                16
#define kCollectionViewToTopMargin                 12
#define kCollectionViewToRightMargin               16
#define kCollectionViewToBottomtMargin             10

#define kCellImageToLabelMargin                    10
#define kCellBtnCenterToBorderMargin               19

typedef void(^ISLimitWidth)(BOOL yesORNo,id data);
static NSString * const kCellIdentifier           = @"CellIdentifier";
static NSString * const kHeaderViewCellIdentifier = @"HeaderViewCellIdentifier";

@interface YFSelectedTagView ()<UICollectionViewDelegate, UICollectionViewDataSource>
@end
@implementation YFSelectedTagView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    if (self =[super initWithFrame:frame collectionViewLayout:layout]) {
        [self makeView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self makeView];
    }
    return self;
}

- (void)makeView {
    
    self.backgroundColor = [UIColor whiteColor];
    [self registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:kCellIdentifier];
    
    [self registerClass:[CollectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kHeaderViewCellIdentifier];
    self.showsHorizontalScrollIndicator = NO;
    self.scrollsToTop = NO;
    self.scrollEnabled = YES;
    
    self.delegate = self;
    self.dataSource = self;
}
#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [self.dataSourceArr count];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSMutableArray * array = self.dataSourceArr[section];
    return array.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell *cell = (CollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentifier forIndexPath:indexPath];
    cell.titleLabel.frame = CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height);
    
    NSMutableArray * array = self.dataSourceArr[indexPath.section];
    
    NSString *text = array[indexPath.row];
    cell.titleLabel.text = text;
    
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 将同一组的cell, 置灰
    CollectionViewCell *removeCell = nil;
    for (CollectionViewCell *cell in self.selectedArr) {
        if (cell.indexPath.section == indexPath.section) {
            cell.isSelected = NO;
            removeCell = cell;
            break;
        }
    }
    [self.selectedArr removeObject:removeCell];
    
    CollectionViewCell *cell = (CollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];;
    cell.isSelected = YES;
    cell.indexPath = indexPath;
    
    [self.selectedArr addObject:cell];
    
    if (self.didSelectedBlock) {
        NSMutableArray *tempArr = [NSMutableArray array];
        for (CollectionViewCell *cell in self.selectedArr) {
            [tempArr addObject:cell.titleLabel.text];
        }
        self.didSelectedBlock(tempArr);
    }
    
//    NSLog(@"count ========= %d", self.selectedArr.count);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqual:UICollectionElementKindSectionHeader]) {
        CollectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kHeaderViewCellIdentifier forIndexPath:indexPath];
        headerView.titleLabel.text = self.titleArr[indexPath.section];
        return (UICollectionReusableView *)headerView;
    }
    return nil;
}


- (float)getCollectionCellWidthText:(NSString *)text{
    float cellWidth;
    CGSize size = [text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]}];
    
    cellWidth = ceilf(size.width) + kCellBtnCenterToBorderMargin;
    cellWidth = [self checkCellLimitWidth:cellWidth isLimitWidth:nil];
    return cellWidth;
}


- (float)checkCellLimitWidth:(float)cellWidth isLimitWidth:(ISLimitWidth)isLimitWidth {
    float limitWidth = (CGRectGetWidth(self.frame)-kCollectionViewToLeftMargin-kCollectionViewToRightMargin);
    if (cellWidth >= limitWidth) {
        cellWidth = limitWidth;
        isLimitWidth?isLimitWidth(YES,@(cellWidth)):nil;
        return cellWidth;
    }
    isLimitWidth?isLimitWidth(NO,@(cellWidth)):nil;
    return cellWidth;
}

#pragma mark - UICollectionViewDelegateLeftAlignedLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // cell 的宽
    NSMutableArray * array = self.dataSourceArr[indexPath.section];
    NSString *text = array[indexPath.row];
    float cellWidth = [self getCollectionCellWidthText:text];
    return CGSizeMake(cellWidth, kCollectionViewCellHeight);
}



- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return kCollectionViewCellsHorizonMargin;//cell之间的间隔
}


// header的size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake([UIScreen mainScreen].bounds.size.width - 50, 38);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    //四周边距
    return UIEdgeInsetsMake(kCollectionViewToTopMargin, kCollectionViewToLeftMargin, kCollectionViewToBottomtMargin, kCollectionViewToRightMargin);
}
#pragma mark - 懒加载
- (NSMutableArray *)dataSourceArr {
    if (!_dataSourceArr) {
        _dataSourceArr = [NSMutableArray array];
    }
    return  _dataSourceArr;
}

- (NSMutableArray *)selectedArr {
    if (!_selectedArr) {
        _selectedArr = [NSMutableArray array];
    }
    return  _selectedArr;
}

- (NSMutableArray *)titleArr {
    if (!_titleArr) {
        _titleArr = [NSMutableArray array];
    }
    return  _titleArr;
}

@end
