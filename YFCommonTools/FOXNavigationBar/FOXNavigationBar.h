//
//  FOXNavigationBar.h
//  FOXNavigationBar
//
//  Created by XFoxer on 16/1/20.
//  Copyright © 2016年 XFoxer. All rights reserved.
//

#import <UIKit/UIKit.h>

/*!
 *  @brief 点击返回按钮回调
 */
typedef void(^BackItemClickBlock)(void);


@interface FOXNavigationBar : UIView

/** 返回按钮回调事件 */
@property (nonatomic, copy) BackItemClickBlock backItemClickBlock;

/** 返回Item */
@property (nonatomic, strong) UIButton *backItem;


/** 标题 */
@property (nonatomic, copy) NSString *title;



/*!@brief
 *  设置左侧视图
 */
- (void)showLeftItemView:(UIButton *)leftItem;


/*!
 *  @brief 设置右侧视图
 *
 *  @param rightItem
 */
- (void)showRightItemView:(UIButton *)rightItem;



/*! @brief 显示添加在Bar上的View
 *
 * @param subView  自定义视图
 * @note  添加自定义视图， 返回按钮需要自己创建，即返回按钮也需要自定义一个
 */
- (void)showCoverView:(UIView *)subView;



/*!
 *  @brief 显示添加在TitleView上的视图
 *  @param subView
 *  @note  添加在TitleView上的视图默认居中显示
 */
- (void)showCoverViewOnTitleView:(UIView *)subView;


/*!@brief
 *  移除自定义视图
 */
- (void)hiddenCoverView:(UIView *)coverView;

/*!
 *  @brief 是否隐藏导航分割线
 *
 *  @param isHidden
 */
- (void)hiddenBarLine:(BOOL)isHidden;


@end
