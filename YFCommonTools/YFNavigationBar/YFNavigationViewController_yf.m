//
//  YFNavigationViewController_yf.m
//  YFNavigationBar_yf
//
//  Created by XFoxer on 16/1/20.
//  Copyright © 2016年 XFoxer. All rights reserved.
//

#import "YFNavigationViewController_yf.h"
#import "UIViewController+YFNavigationBar_yf.h"



@interface YFNavigationViewController_yf ()<UIGestureRecognizerDelegate>

/** 是否允许侧滑返回 */
@property (nonatomic, assign) BOOL fullScreenPopGestureEnabled;

@end

@implementation YFNavigationViewController_yf


- (instancetype)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        //默认最大响应范围
        self.maxAllowedInitialDistance = [UIScreen mainScreen].bounds.size.width;
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        //默认最大响应范围
        self.maxAllowedInitialDistance = [UIScreen mainScreen].bounds.size.width;
    }
    return self;
}


- (void)loadView
{
    [super loadView];
    
    /** 隐藏系统导航栏 */
    [self setNavigationBarHidden:YES];
    

    
    /** 添加侧滑返回的手势 */
    id target = self.interactivePopGestureRecognizer.delegate;
    SEL internalAction = NSSelectorFromString(@"handleNavigationTransition:");
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:target action:internalAction];
    [panGesture setDelegate:self];
    [panGesture setMaximumNumberOfTouches:1];
    [self.view addGestureRecognizer:panGesture];
    [self.interactivePopGestureRecognizer setEnabled:NO];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    
}


#pragma mark - Action Event

/*!
 *  @brief 重写Push方法
 *
 *  @param viewController 堆栈压入的视图
 *  @param animated       是否动画压入
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    /** 添加导航Bar */
    __weak __typeof(self) weakSelf = self;
    YFNavigationBar_yf *foxLazyBar = [[YFNavigationBar_yf alloc]init];
    [foxLazyBar setBackItemClickBlock:^{
        [weakSelf didClickBackItem];
    }];
    [viewController setCustomBar:foxLazyBar];
    [viewController.view addSubview:foxLazyBar];
    
    /** 是否允许侧滑返回 */
    if (viewController.fullScreenPopGestureDisabled) {
        self.fullScreenPopGestureEnabled = NO;
    }
    else
    {
        self.fullScreenPopGestureEnabled = YES;
    }
    
    /** 导航Bar是否隐藏 */
    if (viewController.navigationBarHidden) {
        [foxLazyBar setHidden:YES];
        [foxLazyBar setAlpha:0.0f];
    }
    
    /** 根视图，隐藏返回按钮 */
    if (self.childViewControllers.count == 0) {
        [foxLazyBar.backItem setHidden:YES];
        [foxLazyBar.backItem setAlpha:0.0f];
    }
    [foxLazyBar setTitle:viewController.title];
   
    [super pushViewController:viewController animated:YES];
    
}

/*!
 *  @brief 重写Pop方法  堆栈推出的视图
 *
 *  @param animated 是否动画退出
 *
 *  @return UIViewController
 */
- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    return [super popViewControllerAnimated:animated];
}


/*!
 *  @brief 点击返回按钮
 */
- (void)didClickBackItem
{
    [self popViewControllerAnimated:YES];
}


#pragma mark - Gesture Delegate Methods

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    
    CGPoint beginPosition = [gestureRecognizer locationInView:gestureRecognizer.view];
    CGFloat maxAllowedInitialDistance = self.maxAllowedInitialDistance;
    
    if (maxAllowedInitialDistance > 0 &&  beginPosition.x > maxAllowedInitialDistance) {
        return NO;
    }
    
    if (self.childViewControllers.count == 1) {
        return NO;
    }
    
    if ([[self valueForKey:@"_isTransitioning"] boolValue]) {
        return NO;
    }
    
    if (!self.fullScreenPopGestureEnabled) {
        return NO;
    }
    
    return YES;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
