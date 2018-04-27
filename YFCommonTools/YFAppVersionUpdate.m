//
//  YFAppVersionUpdate.m
//  QuanJieShopProject
//
//  Created by apple on 2018/4/26.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "YFAppVersionUpdate.h"
#import "YFGlobalTool.h"

@interface YFAppVersionUpdate()
@property (nonatomic, strong) NSString *appID;

@end

@implementation YFAppVersionUpdate


+ (instancetype)updateWithAppId:(NSString *)appId {
    // 最好判断id的长度是否为10位
//    if (appId.length == 0) return;
    
    NSString *urlStr = [NSString stringWithFormat:@"http://itunes.apple.com/cn/lookup?id=%@", appId];

    NSData *response = [NSURLConnection sendSynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]] returningResponse:nil error:nil];

//    if (response == nil){
//        NSLog(@"你没有连接网络哦");
//        return;
//    }
    
    NSError *error;
    NSDictionary *appInfoDic = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:&error];
//    NSLog(@"appInfoDic = %@", appInfoDic);
//    if (error){
////        NSLog(@"hsUpdateAppError:%@",error);
//        return;
//    }
    NSArray *array = appInfoDic[@"results"];
    NSDictionary *dic = array[0];
    NSString *updateVersion = dic[@"version"];
//    NSLog(@"dic = %@", dic);
    //获取当前设备中应用的版本号
    NSString *currentVersion = [YFGlobalTool appVersion];
//    if (currentVersion.length == 0) {
//        return;
//    }
    
    YFAppVersionUpdate *update = [[YFAppVersionUpdate alloc] init];
    update.currentVersion = currentVersion;
    update.updateVersion = updateVersion;
    update.appID = appId;
    update.appName = dic[@"trackName"];
    update.title = @"更新提示";
    update.message = [NSString stringWithFormat:@"《%@》有新版本啦!",update.appName];
    update.releaseNotes = dic[@"releaseNotes"];
    
    // 判断商店是否有更新版本
    if ([update.updateVersion compare:update.currentVersion options:NSNumericSearch] == NSOrderedDescending) {
        update.isUpdate = YES;
    }else {
        update.isUpdate = NO;
    }
    
    return update;
}

// 目前只支持这一种样式
- (void)showAlertView {
    
    if (self.isUpdate) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:self.title message:self.message preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"我要更新" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSString *loadUrlStr = [NSString stringWithFormat:@"https://itunes.apple.com/cn/app/id%@", self.appID];
            NSURL *url = [NSURL URLWithString:loadUrlStr];
            [[UIApplication sharedApplication] openURL:url];
        }];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"暂不更新" style:UIAlertActionStyleCancel handler:nil];
        
        [alertController addAction:okAction];
        [alertController addAction:cancelAction];
        UIWindow  *alertWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        alertWindow.rootViewController = [[UIViewController alloc] init];
        alertWindow.windowLevel = UIWindowLevelAlert + 1;
        [alertWindow makeKeyAndVisible];
        [alertWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
    }
}

// 暂时写这里
#pragma mark -- 13.跳转到应用页面
+ (void)gotoAPPStore:(NSString *)appid{
    NSString *str = [NSString stringWithFormat:@"http://itunes.apple.com/us/app/id%@",appid];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}
#pragma mark -- 14.跳转到评价页面
+ (void)gotoCommentAPP:(NSString *)appid{
    NSString *str = [NSString stringWithFormat: @"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id;=%@",
                     appid ];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}
@end
