//
//  MainVC.m
//  德元商城
//
//  Created by 胡隆海 on 2018/8/15.
//  Copyright © 2018年 重庆德弘缘电子商务有限公司. All rights reserved.
//

#import "MainVC.h"

@interface MainVC ()

@end

@implementation MainVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"首页";
        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:@"首页"
                                                           image:[[UIImage imageNamed:@"nav-index-n"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                                   selectedImage:[[UIImage imageNamed:@"nav-index"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        self.tabBarItem = item;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];

}

@end
