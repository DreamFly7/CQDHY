//
//  ZYSuspensionManager.h
//  趣批油
//
//  Created by 四川东汇龙科技有限公司 on 2017/6/12.
//  Copyright © 2017年 胡隆海. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZYSuspensionManager : NSObject

+ (instancetype)shared;

/**
 *  Get UIWindow based on key value
 *
 *  @param key key
 *
 *  @return window
 */
+ (UIWindow *)windowForKey:(NSString *)key;

/**
 *  Save a window and set the key
 *
 *  @param window window
 *  @param key    key
 */
+ (void)saveWindow:(UIWindow *)window forKey:(NSString *)key;

/**
 *  Destroy a window according to key
 *
 *  @param key       key
 */
+ (void)destroyWindowForKey:(NSString *)key;

/**
 *  Destroy all window
 */
+ (void)destroyAllWindow;

@end
