//
//  YFArcherModel.h
//  YFToolsDemo
//
//  Created by apple on 2018/4/27.
//  Copyright © 2018年 BigShow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YFArcherCoder.h"

@interface YFArcherModel : NSObject


// 归档存储信息
+ (void)saveAction:(id)dict;

// 解档存储信息
+ (YFArcherCoder *)takeAction;


@end
