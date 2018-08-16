//
//  Token.h
//  趣批油
//
//  Created by 四川东汇龙科技有限公司 on 2017/6/12.
//  Copyright © 2017年 胡隆海. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Token : NSObject
+ (instancetype)sharedInstance;
+ (void)saveUserToken:(NSString *)token;
+ (NSString *)getUserToken;
+ (void)saveShopToken:(NSString *)token;
+ (NSString *)getShopToken;
@end
