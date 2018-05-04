//
//  FOXNavigationBar.m
//  FOXNavigationBar
//
//  Created by XFoxer on 16/1/20.
//  Copyright © 2016年 XFoxer. All rights reserved.
//

#import "FOXNavigationBar.h"

/** 状态栏高度 */
#define kStatusBarHeight 20.0f

/** 导航BarSize */
#define kBarSize  CGSizeMake([UIScreen mainScreen].bounds.size.width, 64.0f)

/** 导航栏按钮Size */
#define kItemSize CGSizeMake(30.0f, kBarSize.height - kStatusBarHeight)




@interface FOXNavigationBar()


/** 标题Label */
@property (nonatomic, strong) UILabel *titleLabel;

/** 左边按钮 */
@property (nonatomic, strong) UIButton *leftItem;

/** 右边按钮 */
@property (nonatomic, strong) UIButton *rightItem;

/** 导航栏上的分割线 */
@property (nonatomic, strong) UIView *barLine;


@end



@implementation FOXNavigationBar

- (void)dealloc
{
    _backItemClickBlock = nil;
    _barLine = nil;
    _title = nil;
    _titleLabel = nil;
    _leftItem = nil;
}

- (instancetype)init
{
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setFrame:CGRectMake(0, 0, kBarSize.width, kBarSize.height)];
        [self setBackgroundColor:[UIColor whiteColor]];
        
        
        [self initViewFeatures];
        
        [self addSubview:self.barLine = [self createBarSeprateLine]];
        [self addSubview:self.backItem = [self createBackItem]];
        [self addSubview:self.titleLabel = [self createTitleLabel]];
        [self addSubview:self.rightItem = [self createRightItem]];
        
    }
    return self;
}



/*!
 *  @brief 给Bar视图添加效果
 */
- (void)initViewFeatures
{

    /** 添加毛玻璃效果 */
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc]initWithEffect:blur];
    [effectView setFrame:self.frame];
    [self addSubview:effectView];
    
    /** 添加边界阴影效果 */
    [self.layer setShadowColor:[UIColor lightGrayColor].CGColor];
    [self.layer setShadowOffset:CGSizeMake(0, 0)];
    [self.layer setShadowOpacity:0.90f];
    [self.layer setShadowRadius:2.0f];
    
}


#pragma mark - Common Frame

/*!
 *  @brief 左边Item的frame
 *
 *  @return leftFrame
 */
+ (CGRect)leftItemFrame
{
    return CGRectMake(0, kStatusBarHeight, kItemSize.width, kItemSize.height);
}

/*!
 *  @brief 右边Item的frame
 *
 *  @return rightFrame
 */
+ (CGRect)rightItemFrame
{
    CGFloat rightX = kBarSize.width - kItemSize.width;
    return CGRectMake(rightX, kStatusBarHeight, kItemSize.width, kItemSize.height);
}

/*!
 *  @brief 导航栏的frame
 *
 *  @return titleFrame
 */
+ (CGRect)titleViewFrame
{
    CGFloat titleHeight = kBarSize.height - kStatusBarHeight;
    CGFloat titleWidth = kBarSize.width - 2*kItemSize.width;
    CGFloat titlePosX = kItemSize.width;
    CGFloat titlePosY = kStatusBarHeight;
    return CGRectMake(titlePosX, titlePosY, titleWidth, titleHeight);
}



#pragma mark - Create NavView Controls


/*!
 *  @brief 导航栏上的分割线
 *
 *  @return barLine
 */
- (UIView *)createBarSeprateLine
{
    CGFloat seprateHeight = 0.5f;
    
    UIView *barLine = [[UIView alloc]initWithFrame:CGRectMake(0, kBarSize.height - seprateHeight, kBarSize.width, seprateHeight)];
    [barLine setBackgroundColor:[UIColor lightGrayColor]];
    return barLine;
}

/*!
 *  @brief 导航栏上的返回按钮
 *
 *  @return backItem
 */
- (UIButton *)createBackItem
{
    UIButton *backItem = [UIButton buttonWithType:UIButtonTypeCustom];
    [backItem setFrame:[[self class] leftItemFrame]];
    [backItem setImage:[UIImage imageNamed:@"back_item"] forState:UIControlStateNormal];
    [backItem setImage:[UIImage imageNamed:@"back_item"] forState:UIControlStateHighlighted];
    [backItem addTarget:self action:@selector(popViewController) forControlEvents:UIControlEventTouchUpInside];
    return backItem;
}


- (UIButton *)createRightItem
{
    UIButton *rightItem = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightItem setFrame:[[self class] rightItemFrame]];
    [rightItem addTarget:self action:@selector(rightItemClick:) forControlEvents:UIControlEventTouchUpInside];
    return rightItem;
}



/*!
 *  @brief 导航栏上的标题
 *
 *  @return titleLabel
 */
- (UILabel *)createTitleLabel
{
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:[[self class] titleViewFrame]];
    [titleLabel setBackgroundColor:[UIColor clearColor]];
    [titleLabel setFont:[UIFont systemFontOfSize:18.0f]];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [titleLabel setLineBreakMode:NSLineBreakByTruncatingTail];
    return titleLabel;
}



+ (UIButton *)createItemImgNormal:(NSString *)strImg
                     imgHighlight:(NSString *)strImgHighlight
                      imgSelected:(NSString *)strImgSelected
                           target:(id)target
                           action:(SEL)action
{
    
    UIImage *imgNormal = [UIImage imageNamed:strImg];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:imgNormal forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:(strImgHighlight ? strImgHighlight : strImg)] forState:UIControlStateHighlighted];
    [btn setImage:[UIImage imageNamed:(strImgSelected ? strImgSelected : strImg)] forState:UIControlStateSelected];
    
    CGFloat fDeltaWidth = (kItemSize.width - imgNormal.size.width)/2.0f;
    CGFloat fDeltaHeight = (kItemSize.height - imgNormal.size.height)/2.0f;
    fDeltaWidth = (fDeltaWidth >= 2.0f) ? fDeltaWidth/2.0f : 0.0f;
    fDeltaHeight = (fDeltaHeight >= 2.0f) ? fDeltaHeight/2.0f : 0.0f;
    [btn setImageEdgeInsets:UIEdgeInsetsMake(fDeltaHeight, fDeltaWidth, fDeltaHeight, fDeltaWidth)];
    
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(fDeltaHeight, -imgNormal.size.width, fDeltaHeight, fDeltaWidth)];
    
    return btn;
}


#pragma mark - Fountion Methods

/*!
 *  @brief 设置导航栏标题
 *
 *  @param title 标题
 */
- (void)setTitle:(NSString *)title
{
    
    _title = title;
    
    if (!title) {
        [self.titleLabel setText:@""];
        return;
    }
    
    if ([title isEqualToString:self.titleLabel.text]) {
        return;
    }
    
    [self.titleLabel setText:title];
    [self setNeedsDisplay];
    
}

/*!@brief
 *  设置左侧视图
 */
- (void)showLeftItemView:(UIButton *)leftItem
{
    
    if (_leftItem) {
        [self.leftItem removeFromSuperview];
        self.leftItem = nil;
    }
    
    self.leftItem = leftItem;
    if (_leftItem) {
        [self.leftItem setFrame:[[self class] leftItemFrame]];
        [self addSubview:self.leftItem];
    }

}


/*!
 *  @brief 设置右侧视图
 *
 *  @param rightItem
 */
- (void)showRightItemView:(UIButton *)rightItem
{
    if (_rightItem) {
        [self.rightItem removeFromSuperview];
        self.rightItem = nil;
    }
    
    self.rightItem = rightItem;
    if (_rightItem) {
        [self.rightItem setFrame:[[self class] rightItemFrame]];
        [self addSubview:self.rightItem];
    }
}

/*! @brief 显示添加在Bar上的View
 *
 * @param subView  自定义视图
 * @note  添加自定义视图， 返回按钮需要自己创建，即返回按钮也需要自定义一个
 */
- (void)showCoverView:(UIView *)subView
{
    
    if (subView) {
       // [self hiddenBarViews:YES];
        [subView removeFromSuperview];
        
        
        CGFloat barHeight = kBarSize.height - kStatusBarHeight;
        CGFloat barWidth = kBarSize.width;
        
        if (subView.frame.size.height > barHeight) {
            
            CGRect autoSizeRect = subView.frame;
            autoSizeRect.size.height = barHeight;
            subView.frame = autoSizeRect;
            
        }
        
        if (subView.frame.size.width > barWidth) {
            
            CGRect autoSizeRect = subView.frame;
            autoSizeRect.size.width = barWidth;
            subView.frame = autoSizeRect;
        }
        
        [self addSubview:subView];
        
        [self.leftItem setHidden:NO];
        [self bringSubviewToFront:self.leftItem];
    }
    
}

/*!@brief
 *  移除自定义视图
 */
- (void)hiddenCoverView:(UIView *)coverView
{
    
    if (coverView && coverView.superview == self) {
        [coverView removeFromSuperview];
    }
    
}


/*!
 *  @brief 显示添加在TitleView上的视图
 *  @param subView
 *  @note  添加在TitleView上的视图默认居中显示
 */
- (void)showCoverViewOnTitleView:(UIView *)subView
{
    
    if (subView)
    {
        if (self.titleLabel)
        {
            self.titleLabel.hidden = YES;
        }
        
        [subView removeFromSuperview];
        
        CGFloat titleHeight = [[self class] titleViewFrame].size.height;
        CGFloat titleWidth = [[self class] titleViewFrame].size.width;
        
        if (subView.frame.size.height > titleHeight) {
            
            CGRect autoSizeRect = subView.frame;
            autoSizeRect.size.height = titleHeight;
            subView.frame = autoSizeRect;
            
        }
        
        if (subView.frame.size.width > titleWidth) {
            
            CGRect autoSizeRect = subView.frame;
            autoSizeRect.size.width = titleWidth;
            subView.frame = autoSizeRect;
        }
        
        [subView setCenter:CGPointMake(kBarSize.width/2, kStatusBarHeight + titleHeight/2)];
        [self addSubview:subView];
    }
    
}

/*!
 *  @brief 隐藏原生视图控件
 *
 *  @param isHidden 是否隐藏
 */
- (void)hiddenBarViews:(BOOL)isHidden
{
    if (self.leftItem) {
        [self.leftItem setHidden:isHidden];
    }
    
    if (self.rightItem) {
        [self.rightItem setHidden:isHidden];
    }
    
    if (self.backItem) {
        [self.backItem setHidden:isHidden];
    }
    
    if (self.titleLabel) {
        [self.titleLabel setHidden:isHidden];
    }
}

/*!
 *  @brief 是否隐藏导航分割线
 *
 *  @param isHidden
 */
- (void)hiddenBarLine:(BOOL)isHidden
{
    [self.barLine setHidden:isHidden];
    if (isHidden) {
        [self.barLine setAlpha:0.0f];
    }
    else
    {
        [self.barLine setAlpha:1.0f];
    }
}

#pragma mark - Action Event

/*!
 *  @brief 点击返回按钮
 *
 *  @param sender 返回按钮
 */
- (void)popViewController
{
    if (self.backItemClickBlock) {
        self.backItemClickBlock();
    }
}

/*!
 *  @brief 点击返回按钮
 *
 *  @param sender 右侧按钮
 */
- (void)rightItemClick:(id)sender
{
    
}


@end
