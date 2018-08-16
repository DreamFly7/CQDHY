//
//  NSObject+ZYSuspensionView.m
//  趣批油
//
//  Created by 四川东汇龙科技有限公司 on 2017/6/12.
//  Copyright © 2017年 胡隆海. All rights reserved.
//

#import "NSObject+ZYSuspensionView.h"
#import <CommonCrypto/CommonDigest.h>
#import <objc/runtime.h>

const void *zy_suspensionMd5Key = &zy_suspensionMd5Key;

@implementation NSObject (ZYSuspensionView)

- (NSString *)zy_md5Key
{
    NSString *str = objc_getAssociatedObject(self, zy_suspensionMd5Key);
    if (str.length <= 0) {
        NSString *desStr = self.description;
        const char *cStr = [desStr UTF8String];
        unsigned char result[16];
        CC_MD5( cStr, (int)strlen(cStr), result );
        str = [NSString stringWithFormat:
               @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
               result[0],result[1],result[2],result[3],
               result[4],result[5],result[6],result[7],
               result[8],result[9],result[10],result[11],
               result[12],result[13],result[14],result[15]];
        
        objc_setAssociatedObject(self, zy_suspensionMd5Key, str, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return str;
}

@end
