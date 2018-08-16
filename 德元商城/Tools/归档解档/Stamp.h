//
//  Stamp.h
//  趣批油
//
//  Created by 四川东汇龙科技有限公司 on 2017/6/12.
//  Copyright © 2017年 胡隆海. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stamp : NSObject

+ (instancetype)sharedInstance;
+ (void)saveStamp:(NSString *)stamp;
+ (NSString *)getStamp;

@end
