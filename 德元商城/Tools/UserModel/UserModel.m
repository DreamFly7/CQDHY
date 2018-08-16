//
//  UserModel.m
//  趣批油
//
//  Created by 胡隆海 on 2017/5/23.
//  Copyright © 2017年 胡隆海. All rights reserved.
//

#import "UserModel.h"

static UserModel *singletonUser = nil;

@implementation UserModel


+ (id)allocWithZone:(NSZone *)zone
{
    @synchronized(self){
        if (!singletonUser) {
            singletonUser = [super allocWithZone:zone];
            return singletonUser;
        }
    }
    return nil;
}

#pragma mark - public methods.....
+ (id)sharedUser
{
    @synchronized (self){
        if (!singletonUser) {
            singletonUser = [[UserModel alloc] init];
            return singletonUser;
        }
    }
    return singletonUser;
}

- (id)init
{
    if (self = [super init]) {
        
        NSDate *currentDate = [NSDate date];//获取当前时间，日期
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"YYYY/MM/dd hh:mm:ss SS"];
        NSString *dateString = [dateFormatter stringFromDate:currentDate];
        NSLog(@"dateString:%@",dateString);
        
        _check_state= [USER_DEFAULT objectForKey:@"check_state"];
        _city       = [USER_DEFAULT objectForKey:@"city"];
        _county     = [USER_DEFAULT objectForKey:@"county"];
        _idcard     = [USER_DEFAULT objectForKey:@"idcard"];
        _lat        = [USER_DEFAULT objectForKey:@"lat"];
        _lng        = [USER_DEFAULT objectForKey:@"lng"];
        _province   = [USER_DEFAULT objectForKey:@"province"];
        _qqnum      = [USER_DEFAULT objectForKey:@"qqnum"];
        _road       = [USER_DEFAULT objectForKey:@"road"];
        _station_name   = [USER_DEFAULT objectForKey:@"station_name"];
        _tel            = [USER_DEFAULT objectForKey:@"tel"];
        _user_id        = [USER_DEFAULT objectForKey:@"user_id"];
        _wxnum          = [USER_DEFAULT objectForKey:@"wxnum"];
        _sex            = [USER_DEFAULT objectForKey:@"sex"];
        _birth          = [USER_DEFAULT objectForKey:@"birth"];
    }
    return self;
}

- (BOOL)saveToLocal{
    
    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY/MM/dd hh:mm:ss SS"];
    NSString *dateString = [dateFormatter stringFromDate:currentDate];
    NSLog(@"dateString:%@",dateString);
    
    [USER_DEFAULT setObject:_city       forKey:@"check_state"];
    [USER_DEFAULT setObject:_city       forKey:@"city"];
    [USER_DEFAULT setObject:_county     forKey:@"county"];
    [USER_DEFAULT setObject:_idcard     forKey:@"idcard"];
    [USER_DEFAULT setObject:_lat        forKey:@"lat"];
    [USER_DEFAULT setObject:_lng        forKey:@"lng"];
    [USER_DEFAULT setObject:_province   forKey:@"province"];
    [USER_DEFAULT setObject:_qqnum      forKey:@"qqnum"];
    [USER_DEFAULT setObject:_road       forKey:@"road"];
    [USER_DEFAULT setObject:_station_name forKey:@"station_name"];
    [USER_DEFAULT setObject:_tel          forKey:@"tel"];
    [USER_DEFAULT setObject:_user_id      forKey:@"user_id"];
    [USER_DEFAULT setObject:_wxnum        forKey:@"wxnum"];
    [USER_DEFAULT setObject:_sex          forKey:@"sex"];
    [USER_DEFAULT setObject:_birth        forKey:@"birth"];

    [USER_DEFAULT synchronize];
    
    return YES;
}


- (BOOL)clearUserInfo{
    
    [USER_DEFAULT setObject:@"" forKey:@"check_state"];
    [USER_DEFAULT setObject:@"" forKey:@"city"];
    [USER_DEFAULT setObject:@"" forKey:@"county"];
    [USER_DEFAULT setObject:@"" forKey:@"idcard"];
    [USER_DEFAULT setObject:@"" forKey:@"lat"];
    [USER_DEFAULT setObject:@"" forKey:@"lng"];
    [USER_DEFAULT setObject:@"" forKey:@"province"];
    [USER_DEFAULT setObject:@"" forKey:@"qqnum"];
    [USER_DEFAULT setObject:@"" forKey:@"road"];
    [USER_DEFAULT setObject:@"" forKey:@"station_name"];
    [USER_DEFAULT setObject:@"" forKey:@"tel"];
    [USER_DEFAULT setObject:@"" forKey:@"user_id"];
    [USER_DEFAULT setObject:@"" forKey:@"wxnum"];
    [USER_DEFAULT setObject:@"" forKey:@"sex"];
    [USER_DEFAULT setObject:@"" forKey:@"birth"];

    [USER_DEFAULT synchronize];
    
    return YES;
}


@end
