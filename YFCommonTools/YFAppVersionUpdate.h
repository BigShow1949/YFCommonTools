//
//  YFAppVersionUpdate.h
//  QuanJieShopProject
//
//  Created by apple on 2018/4/26.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YFAppVersionUpdate : NSObject

/* 初始化方法 */
+ (instancetype)updateWithAppId:(NSString *)appId;

/* 更新跳转提示框(没有更新的就不显示) */
- (void)showAlertView;
/* 默认显示: 更新提示*/
@property (nonatomic, copy) NSString *title;
/* 默认显示: <<你app的名字>>有版本更新啦! */
@property (nonatomic, copy) NSString *message;


/* 手机已安装的app版本 */
@property (nonatomic, copy) NSString *currentVersion;
/* 苹果商店最新的app版本 */
@property (nonatomic, copy) NSString *updateVersion;
/* 商店是否有更新版本 */
@property (nonatomic, assign) BOOL isUpdate;
/* app的名字 */
@property (nonatomic, copy) NSString *appName;
/* 更新的内容 */
@property (nonatomic, copy) NSString *releaseNotes;

// 暂时先写在这里
//13.跳转到app store 下载页面
+ (void)gotoAPPStore:(NSString *)appid;

//14.跳转到app store 评论页面
+ (void)gotoCommentAPP:(NSString *)appid;

@end
