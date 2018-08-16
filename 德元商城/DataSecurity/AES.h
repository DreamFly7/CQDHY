//
//  AES.h
//  趣批油
//
//  Created by 胡隆海 on 2017/5/24.
//  Copyright © 2017年 胡隆海. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AES : NSObject

//AES加密
+ (NSData *)AES128EncryptWithKey:(NSString *)key iv:(NSString *)iv withNSData:(NSData *)data;

//AES解密
+ (NSData *)AES128DecryptWithKey:(NSString *)key iv:(NSString *)iv withNSData:(NSData *)data;

//转化为Base64
+ (NSString *)base64StringFromText:(NSString *)text;

//由base64转化
+ (NSString *)textFromBase64String:(NSString *)base64;

//base64格式字符串转换为文本数据
+ (NSData *)dataWithBase64EncodedString:(NSString *)string;

//文本数据转换为base64格式字符串
+ (NSString *)base64EncodedStringFrom:(NSData *)data;

@end
