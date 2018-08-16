//
//  Base.h
//  趣批油
//
//  Created by 胡隆海 on 2017/5/24.
//  Copyright © 2017年 胡隆海. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Base : NSObject

// 对一个字符串进行base64编码,并且返回
+(NSString *)base64EncodeString:(NSString *)string;
// 对base64编码之后的字符串解码,并且返回
+(NSString *)base64DecodeString:(NSString *)string;
// 对密码加密
+ (NSString *)passwordBase64EncodeWithString:(NSString *)password;

@end
