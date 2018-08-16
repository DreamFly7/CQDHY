//
//  Utils.h
//  趣批油
//
//  Created by 胡隆海 on 2017/5/23.
//  Copyright © 2017年 胡隆海. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIAlertView;


@interface Utils : NSObject

+(instancetype)sharedInstance;
//获取设备信息&&APP信息
+ (void)getDevice_InfoDictionary;
// 对两个字符串取异或方法
+ (NSData *)encodeData:(NSData *)sourceData withKey:(NSString *)key;
//UIImage大小变更
+ (UIImage*)resizeImage:(UIImage *)img rect:(CGRect)rect;
#pragma mark -- 颜色转图片
+ (UIImage *)callImageWithColor:(UIColor*)color;
//时间差
+(NSString *)intervalSinceNow:(NSString*)theDate;
//判断是不是合法的手机号
+(BOOL)isValidMobileNumber:(NSString *)mobileNum;
//判断是不是合法的邮箱
+(BOOL)isValidEmail:(NSString *)email;
+(BOOL)isBlankString:(NSString *)string;

+(UIAlertView*)alertWithMessage:(NSString*)message;

+(void)countDownBySeconds:(int)seconds callback:(void(^)(BOOL isTimeout,NSInteger leftSeconds))callback;

+(NSString*)DataTOjsonString:(id)object;


///将以为数组转化为二维数组  array：一维数组    section: 二维数组中的子数组的个数
+(NSMutableArray*)toTowSectionArrayWithOneSectionArray:(NSMutableArray*)array withSection:(NSInteger)section;

+(NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

// 计算label的高度
+ (float)getContactHeight:(NSString*)contact withFontSize:(CGFloat)fontSize withLabelWidth:(CGFloat)labelWidth;

@end
