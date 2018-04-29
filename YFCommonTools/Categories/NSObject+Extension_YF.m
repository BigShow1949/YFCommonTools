//
//  NSObject+Extension_YF.m
//  YFToolsDemo
//
//  Created by apple on 2018/4/27.
//  Copyright © 2018年 BigShow. All rights reserved.
//

#import "NSObject+Extension_YF.h"
#import <objc/runtime.h>
@implementation NSObject (Extension_YF)
- (NSArray <NSString *> *)allPropertyNames {
    NSMutableArray *propertyNames = [NSMutableArray array];
    
    unsigned int outCount;
    
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    
    for (int i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        
        NSString *propertyName =
        [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        
        [propertyNames addObject: propertyName];
    }
    
    free(properties);
    
    return propertyNames;
}
@end
