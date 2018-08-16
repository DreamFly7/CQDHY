//
//  LoginVC.m
//  德元商城
//
//  Created by 胡隆海 on 2018/8/15.
//  Copyright © 2018年 重庆德弘缘电子商务有限公司. All rights reserved.
//

#import "LoginVC.h"
#import "RegisterVC.h"

@interface LoginVC ()

@end

@implementation LoginVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"登录";
        self.view.backgroundColor = ColorWhite;
        hSetBackButton(@"");
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)loginBtnEvent:(UIButton *)sender {
    NSLog(@"登录");
    //创建一个消息对象
    NSNotification * notice = [NSNotification notificationWithName:@"loginSuccess" object:nil userInfo:nil];
    //发送消息
    [[NSNotificationCenter defaultCenter] postNotification:notice];
}

- (IBAction)registerBtnEvent:(UIButton *)sender {
    NSLog(@"注册");
    RegisterVC * registerView = [[RegisterVC alloc] init];
    hPushViewController(registerView);
}


@end
