//
//  MD5.h
//  趣批油
//
//  Created by 胡隆海 on 2017/5/24.
//  Copyright © 2017年 胡隆海. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MD5 : NSObject

#pragma mark - 32位 小写
+(NSString *)MD5ForLower32Bate:(NSString *)str;
#pragma mark - 32位 大写
+(NSString *)MD5ForUpper32Bate:(NSString *)str;
#pragma mark - 16位 大写
+(NSString *)MD5ForUpper16Bate:(NSString *)str;
#pragma mark - 16位 小写
+(NSString *)MD5ForLower16Bate:(NSString *)str;

@end
