//
//  LocationTool.h
//  趣批油
//
//  Created by 四川东汇龙科技有限公司 on 2017/6/16.
//  Copyright © 2017年 胡隆海. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocationTool : NSObject
+ (instancetype)sharedInstance;
+ (void)tearDown;
- (void)locationToolEvent;
// 返回各个城市编码
+ (NSMutableDictionary *)getCityCodeEventWithState:(NSString *)State WithCity:(NSString *)City WithSubLocality:(NSString *)SubLocality;
@end
