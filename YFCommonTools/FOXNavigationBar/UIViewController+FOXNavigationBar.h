//
//  UIViewController+FOXNavigationBar.h
//  FOXNavigationBar
//
//  Created by XFoxer on 16/1/21.
//  Copyright © 2016年 XFoxer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FOXNavigationBar.h"


@interface UIViewController (FOXNavigationBar)

/*!@brief
 * 导航栏视图 
 * @note 取名navigationBar 会与系统命名冲突
 */
@property (nonatomic, strong) FOXNavigationBar *customBar;

/** 是否隐藏导航栏视图 */
@property (nonatomic, getter=isNavigationBarHidden) BOOL navigationBarHidden;

/** 是否可以侧滑返回 */
@property (nonatomic, getter=isFullScreenPopGestureDisabled) BOOL fullScreenPopGestureDisabled;

/** 标题 */
@property (nonatomic, copy) NSString *title;



/*!
 *  @brief 将导航视图设置到视图最上层
 */
- (void)bringBarToFront;

/*!
 *  @brief 添加左侧视图
 *
 *  @param leftItem
 */
- (void)showBarLeftItem:(UIButton *)leftItem;


/*!
 *  @brief 添加右侧视图
 *
 *  @param rightItem
 */
- (void)showBarRightItem:(UIButton *)rightItem;


/*!
 *  @brief Bar添加自定义视图
 *
 *  @param subView
 */
- (void)showBarCoverView:(UIView *)subView;


/*!
 *  @brief 隐藏导航栏自定义视图
 *
 *  @param coverView CustomView
 */
- (void)hiddenBarCoverView:(UIView *)coverView;

/*!
 *  @brief 显示添加在TitleView上的视图
 *  @param subView
 *  @note  添加在TitleView上的视图默认居中显示
 */
- (void)showBarTitleCoverView:(UIView *)subView;

/*!
 *  @brief 动态隐藏导航栏
 *
 *  @param animated 是否有动画
 */
- (void)hiddenBarWithAnimation:(BOOL)animated;

/*!
 *  @brief 是否隐藏导航分割线
 *
 *  @param isHidden
 */
- (void)hiddenBarLine:(BOOL)isHidden;


@end
