//
//  UIImage+image.h
//  SinaNews
//
//  Created by 王海军 on 14/12/22.
//  Copyright (c) 2014年 HJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Image)

// 返回一张已经经过拉伸处理的图片
+ (UIImage *)stretchImageWithName:(NSString *)name;

// 返回一张圆形图片
+ (UIImage*)circleImage:(UIImage*)image withInset:(CGFloat)inset;

//  颜色转换为背景图片
+ (UIImage *)imageWithColor:(UIColor *)color;

//  全屏截图
+ (UIImage *)getImageWithFullScreenshot;

// 将图片变灰色
+ (UIImage *)grayImage:(UIImage *)sourceImage;

// 压缩图片质量
+ (UIImage *)reduceImage:(UIImage *)image percent:(float)percent;

// 压缩图片尺寸
+ (UIImage *)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize;

#pragma mark image scale utility  下面都是图片剪裁相关的 具体原因不知做什么的
// 应该是处理图片尺寸之类的  不知道谁从网上拷贝下来的 剪裁图片需要用到
+ (UIImage *)imageByScalingToMaxSize:(UIImage *)sourceImage;

#pragma mark camera utility 这货也是图片剪裁的 上传图片一大堆 整理一下
+ (BOOL) isCameraAvailable;

+ (BOOL) isRearCameraAvailable;

+ (BOOL) isFrontCameraAvailable;

+ (BOOL) doesCameraSupportTakingPhotos;

+ (BOOL) isPhotoLibraryAvailable;

+ (BOOL) cameraSupportsMedia:(NSString *)paramMediaType sourceType:(UIImagePickerControllerSourceType)paramSourceType;

@end
