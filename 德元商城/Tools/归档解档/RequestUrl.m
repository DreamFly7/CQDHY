//
//  RequestUrl.m
//  趣批油
//
//  Created by 四川东汇龙科技有限公司 on 2017/7/11.
//  Copyright © 2017年 胡隆海. All rights reserved.
//

#import "RequestUrl.h"

@implementation RequestUrl

+ (instancetype)sharedInstance{
    
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

+ (void)saveRequestUrl:(NSString *)url
{
    // 归档文件
    [NSKeyedArchiver archiveRootObject:url toFile:RequestUrlPath];
}

+ (NSString *)getRequestUrl
{
    // 读取
    NSString * url = [NSKeyedUnarchiver unarchiveObjectWithFile:RequestUrlPath];
    
    return url;
}

@end
