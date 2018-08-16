//
//  RequestUrl.h
//  趣批油
//
//  Created by 四川东汇龙科技有限公司 on 2017/7/11.
//  Copyright © 2017年 胡隆海. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestUrl : NSObject

+ (instancetype)sharedInstance;
+ (void)saveRequestUrl:(NSString *)url;
+ (NSString *)getRequestUrl;

@end
