//
//  Responds.h
//  AppA
//
//  Created by JackChen on 16/10/19.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Responds : NSObject

@property (nonatomic,assign) BOOL isSuccess; //判断是否请求成功
@property (nonatomic,strong) id responseHeaderObject;//响应头
@property (nonatomic,strong) id resultObject;//请求结果
@property (nonatomic,copy) NSString *resultDsec;//请求结果的描述

@end
