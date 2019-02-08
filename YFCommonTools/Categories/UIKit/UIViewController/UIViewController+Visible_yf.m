//
//  UIViewController+Visible.m
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "UIViewController+Visible_yf.h"

@implementation UIViewController (Visible_yf)
- (BOOL)isVisible {
    return [self isViewLoaded] && self.view.window;
}
@end
