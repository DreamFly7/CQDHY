//
//  AppDelegate.m
//  德元商城
//
//  Created by 胡隆海 on 2018/8/13.
//  Copyright © 2018年 重庆德弘缘电子商务有限公司. All rights reserved.
//

#import "AppDelegate.h"
#import "Imports.h"
#import "MainVC.h"
#import "ShopVC.h"
#import "CarVC.h"
#import "MeVC.h"
#import "LoginVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"\n ===> 程序开始 <===");
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [self createLoginView];
    
    //获取通知中心单例对象
    NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
    //添加当前类对象为一个观察者，接收来自用户中心切换版本时候的通知
    [center addObserver:self selector:@selector(createMainTabBarViewController) name:@"loginSuccess" object:nil];
    [center addObserver:self selector:@selector(createLoginView) name:@"exitSuccess" object:nil];
    
    NSLog(@"测试一下");
    
    return YES;
}

// 登录界面
- (void)createLoginView {
    LoginVC * loginView = [[LoginVC alloc] init];
    UINavigationController * loginNav = [[UINavigationController alloc] initWithRootViewController:loginView];
    loginNav.navigationBar.barTintColor = [UIColor redColor];
    [loginNav.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.window.rootViewController = loginNav;
}

// TabBarView
- (void)createMainTabBarViewController {
    MainVC  * mainView = [[MainVC alloc] init];
    ShopVC  * shopView = [[ShopVC alloc] init];
    CarVC   * carView  = [[CarVC  alloc] init];
    MeVC    * meView   = [[MeVC   alloc] init];
    
    UINavigationController * mainNav = [[UINavigationController alloc] initWithRootViewController:mainView];
    UINavigationController * shopNav = [[UINavigationController alloc] initWithRootViewController:shopView];
    UINavigationController * carNav  = [[UINavigationController alloc] initWithRootViewController:carView];
    UINavigationController * meNav   = [[UINavigationController alloc] initWithRootViewController:meView];
    
    // 导航栏颜色
    mainNav  .navigationBar.barTintColor = [UIColor redColor];
    shopNav  .navigationBar.barTintColor = [UIColor redColor];
    carNav   .navigationBar.barTintColor = [UIColor redColor];
    meNav    .navigationBar.barTintColor = [UIColor redColor];
    
    // 导航栏字体颜色
    [mainNav .navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [shopNav .navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [carNav  .navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [meNav   .navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    // 加入到tabBar
    UITabBarController * tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[mainNav,shopNav,carNav,meNav];
    tabBarController.tabBar.barTintColor = [UIColor redColor];
    tabBarController.tabBar.tintColor    = [UIColor whiteColor];
    
    //不选择状态的背景
    UIImage *bgImage = [Utils callImageWithColor:[UIColor whiteColor]];
    //选择状态的背景（宽度为1 高度为49）
    UIImage *tempImage = [Utils callImageWithColor:[UIColor whiteColor]];
    //根据屏幕宽度定每个选择状态背景的大小
    CGFloat width = SCREEN_W / 4;
    //这个方法比较关键，让一个宽度为2的像素拉长至每个TAB的宽度（HEGIHT:IP6的宽度暂时没有考虑）
    UIImage * selectionImage = [Utils resizeImage:tempImage rect:CGRectMake(0, 0, width, 49)];
    //设置不选择状态背景
    [[UITabBar appearance] setBackgroundImage:bgImage];
    //设置选择状态背景
    [[UITabBar appearance] setSelectionIndicatorImage:selectionImage];
    
    //TabBarItem的字体大小和颜色
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor],NSForegroundColorAttributeName, [UIFont systemFontOfSize:14.0],NSFontAttributeName,nil] forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor],NSForegroundColorAttributeName, [UIFont fontWithName:@"Helvetica" size:14.0f],NSFontAttributeName,nil] forState:UIControlStateSelected];
    
    // 设置tabBar为根试图管理器
    self.window.rootViewController = tabBarController;
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
