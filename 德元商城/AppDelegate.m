//
//  AppDelegate.m
//  德元商城
//
//  Created by 胡隆海 on 2018/8/13.
//  Copyright © 2018年 重庆德弘缘电子商务有限公司. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"\n ===> 程序开始 <===");
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"\n ===> 程序暂行 <===");
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"\n ===> 程序进入后台 <===");
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"\n ===> 程序进入前台 <===");
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"\n ===> 程序重新激活 <===");
}


- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"\n ===> 程序意外暂行 <===");
}


@end
