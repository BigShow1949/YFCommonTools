//
//  UITextField+Extension_yf.m
//  QuanJieShopProject
//
//  Created by apple on 2018/4/27.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "UITextField+Extension_yf.h"

@implementation UITextField (Extension_yf)
#pragma mark -- 46.修改UITextField的placeholder的颜色
+ (UITextField *)changeTextField:(UITextField *)TF PlaceholderColorWith:(UIColor *)color WithFont:(NSInteger)font{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0f) {
        //iOS6.0之后
        NSString *holderText = TF.placeholder;
        NSMutableAttributedString *placeholder = [[NSMutableAttributedString alloc] initWithString:holderText];
        [placeholder addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, holderText.length)];
        [placeholder addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:font] range:NSMakeRange(0, holderText.length)];
        TF.attributedPlaceholder = placeholder;
    }else{
        [TF setValue:color forKeyPath:@"_placeholderLabel.textColor"];
        [TF setValue:[UIFont boldSystemFontOfSize:font] forKeyPath:@"_placeholderLabel.font"];
    }
    return TF;
}
@end
