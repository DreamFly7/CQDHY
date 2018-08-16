//
//  Token.m
//  趣批油
//
//  Created by 四川东汇龙科技有限公司 on 2017/6/12.
//  Copyright © 2017年 胡隆海. All rights reserved.
//

#import "Token.h"

@implementation Token

+ (instancetype)sharedInstance{
    
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

+ (void)saveUserToken:(NSString *)token
{
    // 归档文件
    [NSKeyedArchiver archiveRootObject:token toFile:userTokenPath];
}

+ (NSString *)getUserToken
{
    // 读取
    NSString *token = [NSKeyedUnarchiver unarchiveObjectWithFile:userTokenPath];
    
    return token;
}

+ (void)saveShopToken:(NSString *)token
{
    // 归档文件
    [NSKeyedArchiver archiveRootObject:token toFile:shopTokenPath];
}

+ (NSString *)getShopToken
{
    // 读取
    NSString *token = [NSKeyedUnarchiver unarchiveObjectWithFile:shopTokenPath];
    
    return token;
}

@end
