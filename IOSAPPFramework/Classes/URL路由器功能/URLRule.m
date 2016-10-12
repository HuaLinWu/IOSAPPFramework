//
//  URLRule.m
//  IOSAPPFramework
//
//  Created by 吴华林(平安好房技术中心产品研发部IOS研发团队) on 16/8/16.
//  Copyright © 2016年 吴华林(平安好房技术中心产品研发部IOS研发团队). All rights reserved.
//
/************iphone自带的URL*****************
 关于本机	        prefs:root=General&path=About
 辅助功能	        prefs:root=General&path=ACCESSIBILITY
 飞行模式	        prefs:root=AIRPLANE_MODE
 自动锁定	        prefs:root=General&path=AUTOLOCK
 蓝牙	        prefs:root=Bluetooth
 日期与时间       prefs:root=General&path=DATE_AND_TIME
 FaceTime       prefs:root=FACETIME
 通用	        prefs:root=General
 键盘	        prefs:root=General&path=Keyboard
 iCloud	        prefs:root=CASTLE
 iCloud存储空间	prefs:root=CASTLE&path=STORAGE_AND_BACKUP
 定位服务      	prefs:root=LOCATION_SERVICES
 语言与地区	    prefs:root=General&path=INTERNATIONAL
 邮件、通讯录、日历	prefs:root=ACCOUNT_SETTINGS
 音乐	        prefs:root=MUSIC
 音乐	        prefs:root=MUSIC&path=EQ
 音乐	        prefs:root=MUSIC&path=VolumeLimit
 备忘录	        prefs:root=NOTES
 通知	        prefs:root=NOTIFICATIONS_ID
 电话	        prefs:root=Phone
 照片与相机	    prefs:root=Photos
 描述文件	        prefs:root=General&path=ManagedConfigurationList
 还原	        prefs:root=General&path=Reset
 电话铃声	        prefs:root=Sounds&path=Ringtone
 Safari	        prefs:root=Safari
 声音	        prefs:root=Sounds
 软件更新	        prefs:root=General&path=SOFTWARE_UPDATE_LINK
 App Store	    prefs:root=STORE
 Twitter	    prefs:root=TWITTER
 视频	        prefs:root=VIDEO
 VPN	        prefs:root=General&path=VPN
 墙纸	        prefs:root=Wallpaper
 WiFi	        prefs:root=WIFI
 *****************************/
#import <Foundation/Foundation.h>
#ifndef APPNATIVEVIEWURLSCHEME  //APP原生页面的scheme 宏定义
#define APPNATIVEVIEWURLSCHEME @"IOSAPPFrameWork"
#endif

#ifndef APPNATIVESERVICEURLSCHEME //原生系统服务
#define APPNATIVESERVICEURLSCHEME @"service"
#endif
