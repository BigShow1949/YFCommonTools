//
//  NSData+Extension_yf.m
//  YFToolsDemo
//
//  Created by big show on 2019/1/8.
//  Copyright © 2019年 BigShow. All rights reserved.
//

#import "NSData+Img_yf.h"

@implementation NSData (Img_yf)
+ (NSData *)dataWithImage:(UIImage*)image imageSize:(CGSize)imageSize {
    UIGraphicsBeginImageContext(imageSize);
    [image drawInRect:CGRectMake(0,0,imageSize.width,imageSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return UIImageJPEGRepresentation(newImage, 0.8);
}
@end
