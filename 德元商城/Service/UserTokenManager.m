//
//  UserTokenManager.m
//  publicWelfare
//
//  Created by JackChen on 16/12/15.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "UserTokenManager.h"

@implementation UserTokenManager

static UserTokenManager *manager = nil;

+ (instancetype)shareManager {
    static dispatch_once_t onceToke;
    dispatch_once(&onceToke, ^{
        manager = [[self alloc] init];
    });
    return manager;
}

@end
