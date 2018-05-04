//
//  UIViewController+FOXNavigationBar.m
//  FOXNavigationBar
//
//  Created by XFoxer on 16/1/21.
//  Copyright © 2016年 XFoxer. All rights reserved.
//

#import "UIViewController+FOXNavigationBar.h"
#import <objc/runtime.h>


/*!@brief
 *   给UIViewController 添加属性 setter & getter
 */


@implementation UIViewController (FOXNavigationBar)

@dynamic customBar;
@dynamic navigationBarHidden;
@dynamic fullScreenPopGestureDisabled;
@dynamic title;


#pragma mark - Custom Property

- (FOXNavigationBar *)customBar
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setCustomBar:(FOXNavigationBar *)customBar
{
    objc_setAssociatedObject(self, @selector(customBar), customBar, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}



- (BOOL)isNavigationBarHidden
{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

/**  设置是否隐藏导航栏 */
- (void)setNavigationBarHidden:(BOOL)navigationBarHidden
{
    objc_setAssociatedObject(self, @selector(isNavigationBarHidden), @(navigationBarHidden), OBJC_ASSOCIATION_ASSIGN);
}




- (BOOL)isFullScreenPopGestureDisabled
{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

/** 是否允许侧滑返回 */
- (void)setFullScreenPopGestureDisabled:(BOOL)fullScreenPopGestureDisabled
{
    objc_setAssociatedObject(self, @selector(isFullScreenPopGestureDisabled), @(fullScreenPopGestureDisabled), OBJC_ASSOCIATION_ASSIGN);
}




- (NSString *)title
{
    return objc_getAssociatedObject(self, _cmd);
}

/** 设置Title值 */
- (void)setTitle:(NSString *)title
{
    objc_setAssociatedObject(self, @selector(title), title, OBJC_ASSOCIATION_COPY);
}


#pragma mark - Extension Methods


/*!
 *  @brief 将导航视图设置到视图最上层
 */
- (void)bringBarToFront
{
    
    if (self.customBar) {
       [self.view bringSubviewToFront:self.customBar];
    }
    
}

/*!
 *  @brief 添加左侧视图
 *
 *  @param leftItem
 */
- (void)showBarLeftItem:(UIButton *)leftItem
{
    
    if (self.customBar && leftItem) {
        [self.customBar showLeftItemView:leftItem];
    }
}

/*!
 *  @brief 添加右侧视图
 *
 *  @param rightItem
 */
- (void)showBarRightItem:(UIButton *)rightItem
{
    if (self.customBar && rightItem) {
        [self.customBar showRightItemView:rightItem];
    }
}

/*!
 *  @brief Bar添加自定义视图
 *
 *  @param subView
 */
- (void)showBarCoverView:(UIView *)subView
{
    if (self.customBar && subView) {
        [self.customBar showCoverView:subView];
    }
}

/*!
 *  @brief 隐藏导航栏自定义视图
 *
 *  @param coverView CustomView
 */
- (void)hiddenBarCoverView:(UIView *)coverView
{
    if (self.customBar && coverView) {
        [self.customBar hiddenCoverView:coverView];
    }
}


/*!
 *  @brief 显示添加在TitleView上的视图
 *  @param subView
 *  @note  添加在TitleView上的视图默认居中显示
 */
- (void)showBarTitleCoverView:(UIView *)subView
{
    if (self.customBar && subView) {
        [self.customBar showCoverViewOnTitleView:subView];
    }
}


/*!
 *  @brief 动态隐藏导航栏
 *
 *  @param animated 是否有动画
 */
- (void)hiddenBarWithAnimation:(BOOL)animated
{
    CGFloat barHeight = 64.0f;
    
    [self bringBarToFront];
    if (animated && self.customBar) {
        
        [UIView animateWithDuration:0.3f animations:^{
            [self.customBar setTransform:CGAffineTransformMakeTranslation(0, -barHeight)];
        }];
       
    }
    else
    {
        [UIView animateWithDuration:0.3f animations:^{
           [self.customBar setTransform:CGAffineTransformIdentity];
        }];
        
    }
}

/*!
 *  @brief 是否隐藏导航分割线
 *
 *  @param isHidden
 */
- (void)hiddenBarLine:(BOOL)isHidden
{
    if (self.customBar) {
        [self.customBar hiddenBarLine:isHidden];
    }
}




@end
