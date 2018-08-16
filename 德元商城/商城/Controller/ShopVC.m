//
//  ShopVC.m
//  德元商城
//
//  Created by 胡隆海 on 2018/8/15.
//  Copyright © 2018年 重庆德弘缘电子商务有限公司. All rights reserved.
//

#import "ShopVC.h"

@interface ShopVC ()

@end

@implementation ShopVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"商城";
        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:@"商城"
                                                           image:[[UIImage imageNamed:@"nav-shop-n"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                                   selectedImage:[[UIImage imageNamed:@"nav-shop"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        self.tabBarItem = item;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    
}


@end
