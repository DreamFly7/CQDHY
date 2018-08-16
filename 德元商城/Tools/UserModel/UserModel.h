//
//  UserModel.h
//  趣批油
//
//  Created by 胡隆海 on 2017/5/23.
//  Copyright © 2017年 胡隆海. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface UserModel : NSObject

@property (nonatomic, strong)NSString * check_state;
@property (nonatomic, strong)NSString * city;        // 城市
@property (nonatomic, strong)NSString * county;      // 区县
@property (nonatomic, strong)NSString * idcard;
@property (nonatomic, strong)NSString * lat;         // 纬度
@property (nonatomic, strong)NSString * lng;         // 经度
@property (nonatomic, strong)NSString * province;    // 省
@property (nonatomic, strong)NSString * qqnum;       // QQ
@property (nonatomic, strong)NSString * road;        // 路
@property (nonatomic, strong)NSString * station_name;// 加油站名称
@property (nonatomic, strong)NSString * tel;         // 手机号
@property (nonatomic, strong)NSString * user_id;     // 用户id
@property (nonatomic, strong)NSString * wxnum;       // 微信
@property (nonatomic, strong)NSString * sex;         // 性别
@property (nonatomic, strong)NSString * birth;       // 生日

+ (id)sharedUser;
- (BOOL)saveToLocal;
- (BOOL)clearUserInfo;
@end
