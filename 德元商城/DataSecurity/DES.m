//
//  DES.m
//  趣批油
//
//  Created by 胡隆海 on 2017/5/24.
//  Copyright © 2017年 胡隆海. All rights reserved.
//

#import "DES.h"
#import<CommonCrypto/CommonCryptor.h>

@implementation DES

//DES加密
+(NSString *)encryptSting:(NSString *)sText key:(NSString *)key andDesiv:(NSString *)ivDes
{
    if ((sText == nil || sText.length == 0)
        || (sText == nil || sText.length == 0)
        || (ivDes == nil || ivDes.length == 0)) {
        return @"";
    }
    //gb2312 编码
    NSStringEncoding encoding =CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSData* encryptData = [sText dataUsingEncoding:encoding];
    size_t  dataInLength = [encryptData length];
    const void *   dataIn = (const void *)[encryptData bytes];
    
    CCCryptorStatus ccStatus = nil;
    uint8_t *dataOut = NULL; //可以理解位type/typedef 的缩写（有效的维护了代码，比如：一个人用int，一个人用long。最好用typedef来定义）
    size_t dataOutMoved = 0;
    size_t    dataOutAvailable = (dataInLength + kCCBlockSizeDES) & ~(kCCBlockSizeDES - 1);  dataOut = malloc( dataOutAvailable * sizeof(uint8_t));
    memset((void *)dataOut, 0x0, dataOutAvailable);//将已开辟内存空间buffer的首 1 个字节的值设为值 0
    const void *iv = (const void *) [ivDes cStringUsingEncoding:NSASCIIStringEncoding];
    //CCCrypt函数 加密/解密
    ccStatus = CCCrypt(kCCEncrypt,//  加密/解密
                       kCCAlgorithmDES,//  加密根据哪个标准（des，3des，aes。。。。）
                       kCCOptionPKCS7Padding,//  选项分组密码算法(des:对每块分组加一次密  3DES：对每块分组加三个不同的密)
                       [key UTF8String],  //密钥    加密和解密的密钥必须一致
                       kCCKeySizeDES,//   DES 密钥的大小（kCCKeySizeDES=8）
                       iv, //  可选的初始矢量
                       dataIn, // 数据的存储单元
                       dataInLength,// 数据的大小
                       (void *)dataOut,// 用于返回数据
                       dataOutAvailable,
                       &dataOutMoved);
    
    //编码 base64
    NSData *data = [NSData dataWithBytes:(const void *)dataOut length:(NSUInteger)dataOutMoved];
    Byte *bytes = (Byte *)[data bytes];
    //下面是Byte 转换为16进制。
    NSString *hexStr=@"";
    for(int i=0;i<[data length];i++){
        NSString *newHexStr = [NSString stringWithFormat:@"%x",bytes[i]&0xff];///16进制数
        if([newHexStr length]==1)
            hexStr = [NSString stringWithFormat:@"%@0%@",hexStr,newHexStr];
        else
            hexStr = [NSString stringWithFormat:@"%@%@",hexStr,newHexStr];
    }
    free(dataOut);
    return hexStr;
}

//DES解密
+(NSString *)decryptWithDESString:(NSString *)sText key:(NSString *)key andiV:(NSString *)iv
{
    if ((sText == nil || sText.length == 0)
        || (sText == nil || sText.length == 0)
        || (iv == nil || iv.length == 0)) {
        return @"";
    }
    const void *dataIn;
    size_t dataInLength;
    char *myBuffer = (char *)malloc((int)[sText length] / 2 + 1);
    bzero(myBuffer, [sText length] / 2 + 1);
    for (int i = 0; i < [sText length] - 1; i += 2) {
        unsigned int anInt;
        NSString * hexCharStr = [sText substringWithRange:NSMakeRange(i, 2)];
        NSScanner * scanner = [[NSScanner alloc] initWithString:hexCharStr];
        [scanner scanHexInt:&anInt];
        myBuffer[i / 2] = (char)anInt;
    }
    
    NSData *decryptData =[NSData dataWithBytes:myBuffer length:[sText length] / 2 ];//转成utf-8并decode
    dataInLength = [decryptData length];
    dataIn = [decryptData bytes];
    free(myBuffer);
    CCCryptorStatus ccStatus = nil;
    uint8_t *dataOut = NULL; //可以理解位type/typedef 的缩写（有效的维护了代码，比如：一个人用int，一个人用long。最好用typedef来定义）
    size_t dataOutAvailable = 0; //size_t  是操作符sizeof返回的结果类型
    size_t dataOutMoved = 0;
    
    dataOutAvailable = (dataInLength + kCCBlockSizeDES) & ~(kCCBlockSizeDES - 1);
    dataOut = malloc( dataOutAvailable * sizeof(uint8_t));
    memset((void *)dataOut, 0x0, dataOutAvailable);//将已开辟内存空间buffer的首 1 个字节的值设为值 0
    
    const void *ivDes = (const void *) [iv cStringUsingEncoding:NSASCIIStringEncoding];
    //CCCrypt函数 加密/解密
    ccStatus = CCCrypt(kCCDecrypt,//  加密/解密
                       kCCAlgorithmDES,//  加密根据哪个标准（des，3des，aes。。。。）
                       kCCOptionPKCS7Padding,//  选项分组密码算法(des:对每块分组加一次密  3DES：对每块分组加三个不同的密)
                       [key UTF8String],  //密钥    加密和解密的密钥必须一致
                       kCCKeySizeDES,//   DES 密钥的大小（kCCKeySizeDES=8）
                       ivDes, //  可选的初始矢量
                       dataIn, // 数据的存储单元
                       dataInLength,// 数据的大小
                       (void *)dataOut,// 用于返回数据
                       dataOutAvailable,
                       &dataOutMoved);
    
    NSStringEncoding encoding =CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    
    NSString *result  = [[NSString alloc] initWithData:[NSData dataWithBytes:(const void *)dataOut length:(NSUInteger)dataOutMoved] encoding:encoding];
    free(dataOut);
    return result;
}

@end
