//
//  UIView+ViewController.m
//  趣批油
//
//  Created by 四川东汇龙科技有限公司 on 2017/6/29.
//  Copyright © 2017年 胡隆海. All rights reserved.
//

#import "UIView+ViewController.h"

@implementation UIView (ViewController)

- (UIViewController *)viewController {
    UIResponder *next = self.nextResponder;
    do {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        } else if ([next isKindOfClass:[UINavigationController class]])
        {
            UINavigationController *nav = (UINavigationController *)next;
            return nav.viewControllers.lastObject;
        }
        next = next.nextResponder;
    } while (next != nil);
    return nil;
}

@end
