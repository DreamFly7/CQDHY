//
//  Base.m
//  趣批油
//
//  Created by 胡隆海 on 2017/5/24.
//  Copyright © 2017年 胡隆海. All rights reserved.
//

#import "Base.h"

@implementation Base

// 对一个字符串进行base64编码,并且返回
+(NSString *)base64EncodeString:(NSString *)string {
    // 1.先转换为二进制数据
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    // 2.对二进制数据进行base64编码,完成之后返回字符串
    return [data base64EncodedStringWithOptions:0];
}


// 对base64编码之后的字符串解码,并且返回
+(NSString *)base64DecodeString:(NSString *)string {
    // 注意:该字符串是base64编码后的字符串
    // 1.转换为二进制数据(完成了解码的过程)
    NSData *data = [[NSData alloc]initWithBase64EncodedString:string options:0];
    
    // 2.把二进制数据在转换为字符串
    return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
}

// 对密码加密
+ (NSString *)passwordBase64EncodeWithString:(NSString *)password {
    // 1.添加字符串
    NSString * passwordAddStr = [password stringByAppendingString:add_Str];
    NSLog(@"添加字符串：%@",passwordAddStr);
    // 2.转换为nsdata
    NSData * passwordData = [passwordAddStr dataUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"转换为nsdata：%@",passwordData);
    // 3.异或
    NSData * enPasswordData = [Utils encodeData:passwordData withKey:passTord_Key];
    NSLog(@"异或：%@",enPasswordData);
    // 4.转为字符串
    NSString * passwordDataStr = [[NSString alloc] initWithData:enPasswordData encoding:NSUTF8StringEncoding];
    NSLog(@"转为字符串：%@",passwordDataStr);
    // 5.base64位加密
    NSString * base64PasswordStr = [Base base64EncodeString:passwordDataStr];
    NSLog(@"base64位加密：%@",base64PasswordStr);
    // 6.去掉等号
    NSString * PASSWORD = [base64PasswordStr stringByReplacingOccurrencesOfString:@"=" withString:@""];
    NSLog(@"经加密之后最终结果：%@",PASSWORD);
    return PASSWORD;
}

@end
