//
//  CLRBaseRequest.h
//  BankFinancing
//
//  Created by rimi on 16/6/16.
//  Copyright © 2016年 yuexingcheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Responds.h"

typedef void(^RequestCompletion)(Responds *responds);

@interface BaseRequest : NSObject


+(instancetype)sharedInstance;

/**
 *  网络请求
 *
 *  @param urlString  URL
 *  @param parameters 请求参数
 *  @param callback   回调方法
 */

//POST请求
- (void)startPOSTRequest:(NSString *)urlString parameters:(NSDictionary *)parameters completionHandler:(RequestCompletion) callback;
//GET请求
- (void)startGETRequset:(NSString *)urlString parameters:(NSDictionary *)parameters completionHandler:(RequestCompletion) callback;
//上传图片
- (void)updateProfileHeadImg:(UIImage *)headImg completionHandler:(RequestCompletion) callback;
//取消请求
- (void)cancleRequest;

//POST请求
// 因为一个小原因 这里的网络请求不带提示器 懒得去判断 所以就搬砖一个
- (void)startPOSTRequest11:(NSString *)urlString parameters:(NSDictionary *)parameters completionHandler:(RequestCompletion)callback;

@end
