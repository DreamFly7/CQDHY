//
//  Utils.m
//  趣批油
//
//  Created by 胡隆海 on 2017/5/23.
//  Copyright © 2017年 胡隆海. All rights reserved.
//

#import "Utils.h"
#import "Imports.h"

@implementation Utils

+(instancetype)sharedInstance{
    
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

//获取设备信息&&APP信息
+ (void)getDevice_InfoDictionary {
    //获取设备的基本信息
    //通过UIDevice类的对象，可以获取ios设备如下的信息]
    UIDevice *device = [UIDevice currentDevice];
    NSLog(@"设备的名称:%@",device.name);
    NSLog(@"设备的类型:%@",device.model);
    NSLog(@"设备的类型:%@",device.localizedModel);
    NSLog(@"操作系统的版本号:%@",device.systemVersion);
    //获取设备的UUID
    NSLog(@"设备的UUID:%@",device.identifierForVendor.UUIDString);
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *name = [infoDictionary objectForKey:@"CFBundleName"];
    NSString *version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    NSString *build = [infoDictionary objectForKey:@"CFBundleVersion"];
    
    NSLog(@"\nApp的名称:%@  \nApp的版本号:%@  \nApp的build版本:%@",name,version,build);
}

// 对两个字符串取异或方法
+ (NSData *)encodeData:(NSData *)sourceData withKey:(NSString *)key {
    NSData *keyData = [key dataUsingEncoding:NSUTF8StringEncoding];
    Byte *keyBytes = (Byte *)[keyData bytes];   //取关键字的Byte数组, keyBytes一直指向头部
    
    Byte *sourceDataPoint = (Byte *)[sourceData bytes];  //取需要加密的数据的Byte数组
    
    for (long i = 0; i < [sourceData length]; i++) {
        sourceDataPoint[i] = sourceDataPoint[i] ^ keyBytes[(i % [keyData length])]; //然后按位进行异或运算
    }
    
    return sourceData;
}

//UIImage大小变更
+ (UIImage*)resizeImage:(UIImage *)img rect:(CGRect)rect{
    
    UIGraphicsBeginImageContext(rect.size);
    [img drawInRect:rect];
    UIImage* resizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resizedImage;
}

#pragma mark -- 颜色转图片
+ (UIImage *)callImageWithColor:(UIColor*)color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

/**
 * 时间差
 */
+(NSString *)intervalSinceNow:(NSString*)theDate{
    
    NSDateFormatter *date=[[NSDateFormatter alloc] init];
    [date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *d=[date dateFromString:@"2015-12-12 11:22:00"];
    
    NSTimeInterval late=[d timeIntervalSince1970]*1;
    
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval now=[dat timeIntervalSince1970]*1;
    NSString *timeString=@"";
    
    NSTimeInterval cha = late-now;
    
    NSLog(@"timediffence = %f", cha);
    

    
    if (cha/3600<1) {
        timeString = [NSString stringWithFormat:@"%f", cha/60];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString = [NSString stringWithFormat:@"还有%@分钟活动开始", timeString];
        
    }if (cha/3600>1&&cha/86400<1) {
        timeString = [NSString stringWithFormat:@"%f", cha/3600];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"还有%@小时活动开始", timeString];
    }if (cha/86400>1){
        timeString = [NSString stringWithFormat:@"%f", cha/86400];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString = [NSString stringWithFormat:@"还有%@天活动开始", timeString];
    }
    
    if (cha <= 0) {
        timeString = @"活动正在进行";
    }
    
    NSLog(@"时间 = %@", timeString);
    return timeString;
}


+(NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}


/**
 * 判断是不是合法的手机号码
 */
+(BOOL)isValidMobileNumber:(NSString *)mobileNum{
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[0235-9])\\d{8}$";
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[2378])\\d)\\d{7}$";
    NSString * CU = @"^1(3[0-2]|5[256]|8[356])\\d{8}$";
    NSString * CT = @"^1((33|53|8[0139])[0-9]|349)\\d{7}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES)){
        return YES;
    }else{
        return NO;
    }
}


/**
 * 判断是不是合法的邮箱
 */
+(BOOL)isValidEmail:(NSString *)email{
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:email];
}


+(BOOL)isBlankString:(NSString *)string{
    
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}



+(UIAlertView*)alertWithMessage:(NSString*)message{
    
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:message message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
    [alert show];
    alert.alertViewStyle = UIAlertViewStyleDefault;
    
    [Utils performSelector:@selector(dismssAlertView:) withObject:alert afterDelay:1];
    
    return alert;
}

+(void)dismssAlertView:(UIAlertView *)alert{
    
    [alert dismissWithClickedButtonIndex:0 animated:YES];
}


+(NSURL *)obtainImageURLWithUrlString:(NSString *)urlString{
    
    return [NSURL URLWithString:urlString];
}
/**
 倒计时
 */
+(void)countDownBySeconds:(int)seconds callback:(void(^)(BOOL isTimeout,NSInteger leftSeconds))callback{
    
    __block int timeout=seconds; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){
            dispatch_source_cancel(_timer);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                
                callback(YES,timeout);
                
            });
        }else{
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                callback(NO,timeout);
                
            });
            timeout--;
            
        }
    });
    dispatch_resume(_timer);
    
}

+(NSString*)DataTOjsonString:(id)object{
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}


///将以为数组转化为二维数组  array：一维数组    section: 二维数组中的子数组中元素的个数
+(NSMutableArray*)toTowSectionArrayWithOneSectionArray:(NSMutableArray*)array withSection:(NSInteger)section{
    
    NSMutableArray * tempList = array;
    
    NSMutableArray *newData = [NSMutableArray array];
    
    for (NSInteger i = 0; i < [tempList count]; i++) {
        NSMutableArray *arr = [NSMutableArray array];
        NSInteger counts = 0;
        while (counts != section && i < [tempList count]) {
            counts++;
            [arr addObject:tempList[i]];
            i++;
        }
        [newData addObject:arr];
        i--;
    }
    
    return newData;
}

// 计算label的高度
+ (float)getContactHeight:(NSString*)contact withFontSize:(CGFloat)fontSize withLabelWidth:(CGFloat)labelWidth
{
    NSDictionary *attrs = @{NSFontAttributeName : [UIFont systemFontOfSize:fontSize]};
    CGSize maxSize = CGSizeMake(labelWidth - 20, MAXFLOAT);
    // 计算文字占据的高度
    CGSize size = [contact boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    return size.height;
}


@end
