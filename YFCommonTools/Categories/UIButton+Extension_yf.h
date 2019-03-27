//
//  UIButton+Extension_yf.h
//  YFToolsDemo
//
//  Created by apple on 2018/4/25.
//  Copyright © 2018年 BigShow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extension_yf)
#pragma mark - 文字对图片的相对位置
typedef NS_ENUM(NSInteger,LLButtonStyle) {
    LLButtonStyleTextOnly = 1, //只显示文字
    LLButtonStyleImgOnly,      //只显示图片
    LLButtonStyleTextLeft,     //文字在左，图片在右
    LLButtonStyleTextRight,    //文字在右，图片在左
    LLButtonStyleTextTop,      //文字在上，图片在下
    LLButtonStyleTextBottom,   //文字在下，图片在上
    LLButtonStyleTextMiddle,   //文字/图片都在中间
};


//调用这个方法前，必须先设置好button的image和title/attributedtitle 要不然无法生效
- (void)layoutButtonWithEdgeInsetsStyle:(LLButtonStyle)style
                        imageTitleSpace:(CGFloat)space;

#pragma mark - 按钮点击时间间隔
#define defaultInterval .5  //默认时间间隔
/**设置点击时间间隔*/
@property (nonatomic, assign) NSTimeInterval timeInterval;


@end
