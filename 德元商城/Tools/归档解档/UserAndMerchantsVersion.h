//
//  UserAndMerchantsVersion.h
//  趣批油
//
//  Created by 四川东汇龙科技有限公司 on 2017/6/19.
//  Copyright © 2017年 胡隆海. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserAndMerchantsVersion : NSObject

+ (instancetype)sharedInstance;
+ (void)saveUserAndMerchantsVersion:(NSString *)UserAndMerchantsVersion;
+ (NSString *)getUserAndMerchantsVersion;

@end
