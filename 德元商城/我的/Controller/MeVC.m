//
//  MeVC.m
//  德元商城
//
//  Created by 胡隆海 on 2018/8/15.
//  Copyright © 2018年 重庆德弘缘电子商务有限公司. All rights reserved.
//

#import "MeVC.h"

@interface MeVC ()

@end

@implementation MeVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"我的";
        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:@"我的"
                                                           image:[[UIImage imageNamed:@"nav-me-n"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                                   selectedImage:[[UIImage imageNamed:@"nav-me"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        self.tabBarItem = item;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (IBAction)exitBtnEvent:(UIButton *)sender {
    //创建一个消息对象
    NSNotification * notice = [NSNotification notificationWithName:@"exitSuccess" object:nil userInfo:nil];
    //发送消息
    [[NSNotificationCenter defaultCenter] postNotification:notice];
}


@end
