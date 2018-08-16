//
//  UserAndMerchantsVersion.m
//  趣批油
//
//  Created by 四川东汇龙科技有限公司 on 2017/6/19.
//  Copyright © 2017年 胡隆海. All rights reserved.
//

#import "UserAndMerchantsVersion.h"

@implementation UserAndMerchantsVersion

+(instancetype)sharedInstance{
    
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

+ (void)saveUserAndMerchantsVersion:(NSString *)UserAndMerchantsVersion
{
    // 归档文件
    [NSKeyedArchiver archiveRootObject:UserAndMerchantsVersion toFile:UserAndMerchantsVersionPath];
    NSLog(@"版本归档成功 当前为%@",UserAndMerchantsVersion);
}

+ (NSString *)getUserAndMerchantsVersion
{
    // 读取
    NSString * UserAndMerchantsVersion = [NSKeyedUnarchiver unarchiveObjectWithFile:UserAndMerchantsVersionPath];
    NSLog(@"版本解档成功 当前为%@",UserAndMerchantsVersion);
    return UserAndMerchantsVersion;
}


@end
