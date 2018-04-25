//
//  NSString+file.h
//  SinaNews
//
//  Created by 王海军 on 14/12/22.
//  Copyright (c) 2014年 HJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (File)

- (NSString *)fileNameAppend:(NSString *)append;

- (NSString *)URLEncodedString;

@end
