//
//  TimeStamp.h
//  趣批油
//
//  Created by 胡隆海 on 2017/5/24.
//  Copyright © 2017年 胡隆海. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeStamp : NSObject

///由时间戳转为时间格式
+(NSString *)timeStampToString:(CGFloat)timeStamp;

@end
