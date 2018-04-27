//
//  YFGlobalTool.m
//  QuanJieShopProject
//
//  Created by apple on 2018/4/27.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "YFGlobalTool.h"

@implementation YFGlobalTool
#pragma mark -- 1.打电话
+ (void)callWithPhoneNumber:(NSString *)phoneNumber {
    // 还有tel://
    NSString *callPhone = [NSString stringWithFormat:@"telprompt://%@", phoneNumber];

    if (@available(iOS 10.0, *)) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:callPhone] options:@{} completionHandler:nil];
    } else {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:callPhone]];
    }
}

#pragma mark -- 2.判断网络状态
+ (NetworkType)getNetworkType{
    NSArray *children;
    UIApplication *app = [UIApplication sharedApplication];

    NetworkType state = NetworkType_Offline;
    //iPhone X
    if ([[app valueForKeyPath:@"_statusBar"] isKindOfClass:NSClassFromString(@"UIStatusBar_Modern")]) {
        children = [[[[app valueForKeyPath:@"_statusBar"] valueForKeyPath:@"_statusBar"] valueForKeyPath:@"foregroundView"] subviews];
        for (UIView *view in children) {
            for (id child in view.subviews) {
                //wifi
                if ([child isKindOfClass:NSClassFromString(@"_UIStatusBarWifiSignalView")]) {
                    state = NetworkType_WIFI; // wifi
                }
                //2G 3G 4G
                if ([child isKindOfClass:NSClassFromString(@"_UIStatusBarStringView")]) {
                    if ([[child valueForKey:@"_originalText"] containsString:@"G"]) {
                        NSString *stateStr = [child valueForKey:@"_originalText"];
                        switch ([stateStr intValue]) {
                            case 1:  // 2G
                                state = NetworkType_2G;
                                break;
                            case 2: // 3G
                                state = NetworkType_3G;
                                break;
                            case 3: // 4G
                                state = NetworkType_4G;
                                
                            default:
                                break;
                        }
                    }
                }
            }
        }
        //        if (![state isStringValid]) {
        //            state = @"无网络";
        //        }
    }else {
        children = [[[app valueForKeyPath:@"_statusBar"] valueForKeyPath:@"foregroundView"] subviews];
        for (id child in children) {
            if ([child isKindOfClass:NSClassFromString(@"UIStatusBarDataNetworkItemView")]) {
                //获取到状态栏
                switch ([[child valueForKeyPath:@"dataNetworkType"] intValue]) {
                    case 0:  //无网模式
                        state = NetworkType_Offline;
                        break;
                    case 1:  // 2G
                        state = NetworkType_2G;
                        break;
                    case 2: // 3G
                        state = NetworkType_3G;
                        break;
                    case 3: // 4G
                        state = NetworkType_4G;
                        break;
                    case 4: //LTE
                        state = NetworkType_LTE;
                        break;
                    case 5: //WIFI
                        state = NetworkType_WIFI;
                        break;
                    default:
                        state = NetworkType_Offline;
                        break;
                }
            }
        }
    }
    return state;
}

#pragma mark -- 3.判断是否越狱
static const char* jailbreak_apps[] =
{
    "/Applications/Cydia.app",
    "/Applications/limera1n.app",
    "/Applications/greenpois0n.app",
    "/Applications/blackra1n.app",
    "/Applications/blacksn0w.app",
    "/Applications/redsn0w.app",
    "/Applications/Absinthe.app",
    NULL,
};
+ (BOOL)hasCydia{
    // Now check for known jailbreak apps. If we encounter one, the device is jailbroken.
    for (int i = 0; jailbreak_apps[i] != NULL; ++i)
    {
        if ([[NSFileManager defaultManager] fileExistsAtPath:[NSString stringWithUTF8String:jailbreak_apps[i]]])
        {
            return YES;
        }
    }
    
    return NO;
}
+ (BOOL)hasAPT{
    return [[NSFileManager defaultManager] fileExistsAtPath:@"/private/var/lib/apt/"];
}
+ (BOOL)isJailBroken{
    if ([YFGlobalTool hasAPT] || [YFGlobalTool hasCydia]) {
        return YES;
    }
    return NO;
}

#pragma mark -- 4.获取系统相关路径
+ (NSString *)getSystemPath:(SystemPathType)path {
    NSString *pathTmp;
    if (path == SystemPathType_Home) {
        NSString *homeDirectory = NSHomeDirectory();
        pathTmp = homeDirectory;
    }
    if (path == SystemPathType_Document) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *path= [paths objectAtIndex:0];
        pathTmp = path;
    }
    if (path == SystemPathType_Cache) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        NSString *path = [paths objectAtIndex:0];
        pathTmp = path;
    }
    if (path == SystemPathType_Library) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
        NSString *path = [paths objectAtIndex:0];
        pathTmp = path;
    }
    return pathTmp;
}
#pragma mark -- 5.打开另一个程序
+ (BOOL)openOtherAPP:(NSString *)urlSchemes{
    NSURL *urlTmp = [NSURL URLWithString:urlSchemes];
    if ([[UIApplication sharedApplication] canOpenURL:urlTmp]) {
        [[UIApplication sharedApplication] openURL:urlTmp];
    }else{
        return NO;
    }
    return YES;
}

#pragma mark -- 6.字典转换成Json字符串
+ (NSString *)dictChangeToJsonStr:(NSDictionary *)dict{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString;
    
    if (!jsonData) {
        NSLog(@"%@",error);
    }else{
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    
    NSRange range = {0,jsonString.length};
    
    //去掉字符串中的空格
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    
    NSRange range2 = {0,mutStr.length};
    
    //去掉字符串中的换行符
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    
    return mutStr;
}
#pragma mark -- 7.计算size
+ (CGSize)sizeWithString:(NSString *)str font:(int)font {
    return [YFGlobalTool sizeWithString:str font:font maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
}
+ (CGSize)sizeWithString:(NSString *)str font:(int)font maxSize:(CGSize)maxSize {
    NSDictionary *dict = @{NSFontAttributeName : [UIFont systemFontOfSize:font]};
    CGSize size = [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return size;
}
#pragma mark -- 获取App的版本号
+ (NSString *)appVersion{
    NSDictionary* infoDict = [[NSBundle mainBundle] infoDictionary];
    NSString* version = [infoDict objectForKey:@"CFBundleShortVersionString"];
    return version;
}
@end
