//
//  FOXThirdViewController.m
//  FOXNavigationBar
//
//  Created by 徐惠雨 on 16/1/23.
//  Copyright © 2016年 XFoxer. All rights reserved.
//

#import "FOXThirdViewController.h"
#import "UIViewController+FOXNavigationBar.h"

@implementation FOXThirdViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    [self setTitle:@"Pop Gesture Disabled"];
    [self setFullScreenPopGestureDisabled:YES];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
