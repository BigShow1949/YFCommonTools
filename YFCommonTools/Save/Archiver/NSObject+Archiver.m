//
//  NSObject+Archiver.m
//  YFToolsDemo
//
//  Created by apple on 2018/4/27.
//  Copyright © 2018年 BigShow. All rights reserved.
//

#import "NSObject+Archiver.h"
#import "NSObject+Extension_yf.h"
#import "YFSaveTool.h"

NSString * const archiverFileDirectoryName = @"YFArchiver";

// 哪里遵守了NSCoding协议?
@implementation NSObject (Archiver)
- (BOOL)archiveWithName:(NSString *)name {
    NSString *path = [[self class] _pathWithName: name];
    
    [[self class] _createDicWithPath: path];
    
    return [NSKeyedArchiver archiveRootObject: self toFile: path];
}

+ (id)unArchiveWithName:(NSString *)name {
    return [NSKeyedUnarchiver unarchiveObjectWithFile: [[self class] _pathWithName: name]];
}

+ (void)_createDicWithPath:(NSString *)path {
    NSFileManager *fileManager = [NSFileManager new];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath: path]) {
        [fileManager createDirectoryAtPath: [NSString stringWithFormat:@"%@/%@", [YFSaveTool getSystemPath:SystemPathType_Document], archiverFileDirectoryName] withIntermediateDirectories:YES attributes:nil error:nil];
    }
}

+ (NSString *)_pathWithName:(NSString *)name{
    NSString *docPath = [YFSaveTool getSystemPath:SystemPathType_Document];
    NSString *path = [docPath stringByAppendingPathComponent: [NSString stringWithFormat:@"%@/%@_%@.archiver", archiverFileDirectoryName,NSStringFromClass(self.class), name]];
    return path;
}


#pragma mark -- NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
    NSArray *propertyNames = [self allPropertyNames];
    for (NSString *propertyName in propertyNames) {
        [aCoder encodeObject: [self valueForKey:propertyName] forKey: propertyName];
    }
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-designated-initializers"

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    NSArray *propertyNames = [self allPropertyNames];
    for (NSString *propertyName in propertyNames) {
        [self setValue: [aDecoder decodeObjectForKey:propertyName] forKey: propertyName];
    }
    return self;
}

#pragma clang diagnostic pop
@end
