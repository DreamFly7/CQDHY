//
//  TimeStamp.m
//  趣批油
//
//  Created by 胡隆海 on 2017/5/24.
//  Copyright © 2017年 胡隆海. All rights reserved.
//

#import "TimeStamp.h"

@implementation TimeStamp

+(NSString *)timeStampToString:(CGFloat)timeStamp {
    
    NSString *timeString = [[NSString alloc]init];
    
    //当前时间的时间戳
    NSTimeInterval  timeNow=[[NSDate date] timeIntervalSince1970];
    
    //将传来的时间戳转为标准时间格式
    NSTimeInterval time = timeStamp;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *tempStr= [dateFormatter stringFromDate:date];
    
    timeString = [NSString stringWithFormat:@"%@年%@月%@日 %@",[tempStr substringWithRange:NSMakeRange(0,4)],[tempStr substringWithRange:NSMakeRange(5,2)],[tempStr substringWithRange:NSMakeRange(8,2)],[tempStr substringWithRange:NSMakeRange(11,8)]];
    
    //当前时间
    NSDate *nowDate = [NSDate date];
    NSString *nowDateStr= [dateFormatter stringFromDate:nowDate];
    
    //时间戳判断逻辑
    if ([[timeString substringWithRange:NSMakeRange(0, 4)] isEqualToString:[nowDateStr substringWithRange:NSMakeRange(0, 4)]]) {
        
        if ([[timeString substringWithRange:NSMakeRange(5,2)] isEqualToString:[nowDateStr substringWithRange:NSMakeRange(5,2)]]) {
            
            float daySubtract = [[nowDateStr substringWithRange:NSMakeRange(8,2)] floatValue] - [[timeString substringWithRange:NSMakeRange(8,2)] floatValue];
            
            if (daySubtract < 3) {
                
                if (daySubtract == 0) {
                    
                    NSString *string = [NSString stringWithFormat:@"今天 %@",[timeString substringWithRange:NSMakeRange(11,6)]];
                    return  string;
                    
                }else if (daySubtract == 1) {
                    
                    NSString *string = [NSString stringWithFormat:@"昨天 %@",[timeString substringWithRange:NSMakeRange(11,6)]];
                    return  string;
                }else {
                    
                    if ((timeNow - time) > 3600*24*2) {
                        
                        return timeString;
                    }else {
                        
                        NSString *string = [NSString stringWithFormat:@"前天 %@",[timeString substringWithRange:NSMakeRange(11,6)]];
                        return  string;
                    }
                    
                }
                
            }else{
                
                return timeString; 
            }
            
        }else {
            return timeString;
            
        }
        
    }else {
        
        return timeString;
    }
    
}

@end
