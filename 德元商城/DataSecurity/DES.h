//
//  DES.h
//  趣批油
//
//  Created by 胡隆海 on 2017/5/24.
//  Copyright © 2017年 胡隆海. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DES : NSObject

//DES加密
+(NSString *)encryptSting:(NSString *)sText key:(NSString *)key andDesiv:(NSString *)ivDes;

//DES解密
+(NSString *)decryptWithDESString:(NSString *)sText key:(NSString *)key andiV:(NSString *)iv;


@end
