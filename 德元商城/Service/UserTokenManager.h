//
//  UserTokenManager.h
//  publicWelfare
//
//  Created by JackChen on 16/12/15.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserTokenManager : NSObject

@property (strong, nonatomic) NSString *token;    //个人用户token
@property (strong, nonatomic) NSString *account;  //个人用户account

+ (instancetype)shareManager;

@end
