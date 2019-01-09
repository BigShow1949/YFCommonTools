//
//  NSData+Extension_YF.m
//  YFToolsDemo
//
//  Created by big show on 2019/1/8.
//  Copyright © 2019年 BigShow. All rights reserved.
//

#import "NSData+Extension_YF.h"

@implementation NSData (Extension_YF)
+ (NSData *)dataWithImage:(UIImage*)image imageSize:(CGSize)imageSize {
    UIGraphicsBeginImageContext(imageSize);
    [image drawInRect:CGRectMake(0,0,imageSize.width,imageSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return UIImageJPEGRepresentation(newImage, 0.8);
}
@end
