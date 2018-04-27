//
//  YFDevice.h
//  QuanJieShopProject
//
//  Created by apple on 2018/4/27.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
/******************************  设备信息  *********************************/
@interface YFDevice : NSObject

//25.获得设备型号
+ (NSString *)getDeviceVersion;

//26.获得机主名字
+ (NSString *)getPhoneUserName;

//27.获取iOS设备硬件信息
+ (NSString *)getPhoneInformation;

@end
