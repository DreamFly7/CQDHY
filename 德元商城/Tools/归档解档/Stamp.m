//
//  Stamp.m
//  趣批油
//
//  Created by 四川东汇龙科技有限公司 on 2017/6/12.
//  Copyright © 2017年 胡隆海. All rights reserved.
//
// 归档 解档

#import "Stamp.h"

@implementation Stamp

+ (instancetype)sharedInstance{
    
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

+ (void)saveStamp:(NSString *)stamp
{
    // 归档文件
    [NSKeyedArchiver archiveRootObject:stamp toFile:stampPath];
}

+ (NSString *)getStamp
{
    // 读取
    NSString * stamp = [NSKeyedUnarchiver unarchiveObjectWithFile:stampPath];
    
    return stamp;
}

@end
