//
//  CarVC.m
//  德元商城
//
//  Created by 胡隆海 on 2018/8/15.
//  Copyright © 2018年 重庆德弘缘电子商务有限公司. All rights reserved.
//

#import "CarVC.h"

@interface CarVC ()

@end

@implementation CarVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"购物车";
        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:@"购物车"
                                                           image:[[UIImage imageNamed:@"nav-oil-n"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                                   selectedImage:[[UIImage imageNamed:@"nav-oil"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        self.tabBarItem = item;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    
}

@end
