//
//  CLRBaseRequest.m
//  BankFinancing
//
//  Created by rimi on 16/6/16.
//  Copyright © 2016年 yuexingcheng. All rights reserved.
//

#import "BaseRequest.h"
#import "AFNetworking.h"
#import "UserTokenManager.h"

@interface BaseRequest()
@property (nonatomic,strong)NSURLSessionDataTask *dataTask;
@end

@implementation BaseRequest

+(instancetype)sharedInstance{
    
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

//POST请求
- (void)startPOSTRequest:(NSString *)urlString parameters:(NSDictionary *)parameters completionHandler:(RequestCompletion)callback {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    // 设置超时时间
    manager.requestSerializer.timeoutInterval = 10;
    // 设置解析器
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    // 设置请求头
    [manager.requestSerializer setValue:hUUID   forHTTPHeaderField:@"DEVICE-UUID"]; // 设备的UUID
    [manager.requestSerializer setValue:@"1"    forHTTPHeaderField:@"DEVICE-MODEL"]; // 设备类型 安卓0 iOS 1
    [manager.requestSerializer setValue:hSystemVersion forHTTPHeaderField:@"DEVICE-VERSION"]; // 当前设备的系统版本
    NSDictionary * infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString * version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    [manager.requestSerializer setValue:version forHTTPHeaderField:@"APP-VERSION"]; // 当前app版本号
    
    if ([Version isEqualToString:@"商家版"]) {
        [manager.requestSerializer setValue:[Token getShopToken] forHTTPHeaderField:@"APP-TOKEN"]; //个人用户token,登录用
        NSLog(@"读取商家之后的token:%@",[Token getShopToken]);
    } else {
        [manager.requestSerializer setValue:[Token getUserToken] forHTTPHeaderField:@"APP-TOKEN"]; //个人用户token,登录用
        NSLog(@"读取用户之后的token:%@",[Token getUserToken]);
    }
    
    [manager.requestSerializer setValue:[Stamp getStamp] forHTTPHeaderField:@"STAMP"]; // 时间戳
    NSLog(@"网络请求时的时间戳：%@",[Stamp getStamp]);
    
    NSString *completionUrl = [NSString stringWithFormat:@"%@%@",[RequestUrl getRequestUrl],urlString];
    NSLog(@"服务器地址：%@",[RequestUrl getRequestUrl]);
    // 进行网络请求，并接受返回的请求任务
    // 弹框显示加载中
//    [MBProgressHUD showMessage:@"加载数据中....."];
    
    self.dataTask = [manager POST:completionUrl parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSHTTPURLResponse * responseHeader = (NSHTTPURLResponse*)task.response;
        NSLog(@"Header：%@",responseHeader.allHeaderFields);
        
        NSString * stampStr = [NSString stringWithFormat:@"%@",responseHeader.allHeaderFields[@"stamp"]];
        [Stamp saveStamp:stampStr]; // 每次保存时间戳
        
        NSDictionary * response = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
//        NSLog(@"Body：%@",response);
        
        Responds * responds = [[Responds alloc]init];
        NSInteger resultCode = [response[@"status"] integerValue];
        
        // 移除HUD
//        [MBProgressHUD hideHUDForView:nil];
        
        if(resultCode == 1) {
            responds.isSuccess = YES;
            responds.responseHeaderObject = responseHeader.allHeaderFields;
            responds.resultObject = response;
            responds.resultDsec = @"获取数据成功";
        } else {
            responds.isSuccess = NO;
            responds.responseHeaderObject = nil;
            responds.resultObject = nil;
            responds.resultDsec = response[@"msg"];
            // 弹框显示失败
            [Utils alertWithMessage:responds.resultDsec];
            NSLog(@"msg:%@",responds.resultDsec);
        }
        if (callback != nil) {
            callback(responds);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error.description);
        Responds *responds = [[Responds alloc]init];
        responds.isSuccess = NO;
        responds.responseHeaderObject = nil;
        responds.resultObject = nil;
        responds.resultDsec = error.localizedDescription;
        //判断错误编码，对不同类型的错误进行不同的处理
        
        // 移除HUD
//        [MBProgressHUD hideHUDForView:nil];
        
        if (error.code == NSURLErrorTimedOut) {
            responds.resultDsec = @"加载超时";
            [Utils alertWithMessage:responds.resultDsec];
        } else if (error.code == NSURLErrorCancelled) {
            responds.resultDsec = @"取消请求";
            [Utils alertWithMessage:responds.resultDsec];
        } else {
            responds.resultDsec = @"服务器升级中...";
            [Utils alertWithMessage:responds.resultDsec];
        }

        if (callback != nil) {
            callback(responds);
        }
    }];
}

//GET请求
- (void)startGETRequset:(NSString *)urlString parameters:(NSDictionary *)parameters completionHandler:(RequestCompletion) callback {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 10;
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager.requestSerializer setValue:[UserTokenManager shareManager].token forHTTPHeaderField:@"admintoken"];
    NSString *completionUrl = [NSString stringWithFormat:@"%@%@",[RequestUrl getRequestUrl],urlString];
    self.dataTask = [manager GET:completionUrl parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *response = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        NSLog(@"请求成功，返回数据为：%@",response);
        Responds *responds = [[Responds alloc]init];
        NSInteger resultCode = [response[@"code"] integerValue];
        if (resultCode == 1001) {
            responds.isSuccess = YES;
            responds.resultObject = response[@"result"];
            responds.resultDsec = @"获取数据成功";
        }else {
            responds.isSuccess = NO;
            responds.resultObject = nil;
            responds.resultDsec = response[@"result"];
        }
        if (callback != nil) {
            callback(responds);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        Responds *responds = [[Responds alloc]init];
        responds.isSuccess = NO;
        responds.resultObject = nil;
        responds.resultDsec = error.localizedDescription;
        //判断错误编码，对不同类型的错误进行不同的处理
        if (error.code == NSURLErrorTimedOut) {
            responds.resultDsec = @"请求超时";
        } else if (error.code == NSURLErrorCancelled) {
            responds.resultDsec = @"取消请求";
        } else {
            responds.resultDsec = @"请求失败";
        }
        if (callback != nil) {
            callback(responds);
        }
    }];
}

//上传图片
- (void)updateProfileHeadImg:(UIImage *)headImg completionHandler:(RequestCompletion) callback {
    UIImage *result = headImg;
    NSString *pathStr = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filename = [pathStr stringByAppendingPathComponent:@"imageName.png"];
    NSData *data = UIImageJPEGRepresentation(headImg, 1.0);
    while (data.length > 1000000) {
        data = UIImageJPEGRepresentation(result, 0.5);
        result = [UIImage imageWithData:data];
    }
    NSError *error;
    [data writeToFile:filename options:NSDataWritingAtomic error:&error];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //接收类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
                                                         @"text/html",
                                                         @"image/jpeg",
                                                         @"image/png",
                                                         @"application/octet-stream",
                                                         @"text/json",
                                                         nil];
    NSString *apiPath = [NSString stringWithFormat:@"1111"];
    [manager POST:apiPath parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        NSData *imageData = UIImageJPEGRepresentation(result, 1);
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString *str = [formatter stringFromDate:[NSDate date]];
        NSString *fileName = [NSString stringWithFormat:@"%@.jpg", str];
        
        //上传的参数(上传图片，以文件流的格式)
        [formData appendPartWithFileData:imageData
                                    name:@"upimage"
                                fileName:fileName
                                mimeType:@"image/jpeg"];
    } success:^(NSURLSessionDataTask *task, id responseObject) {
        //上传成功
        NSLog(@"%@", responseObject);
        Responds *responds = [[Responds alloc]init];
        NSInteger resultCode = [responseObject[@"code"] integerValue];
        if (resultCode == 1001) {
            responds.isSuccess = YES;
            responds.resultObject = responseObject[@"result"];
            responds.resultDsec = @"获取数据成功";
        } else {
            responds.isSuccess = NO;
            responds.resultObject = nil;
            responds.resultDsec = @"上传头像失败";
        }
        if (callback != nil) {
            callback(responds);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        //上传失败
        Responds *responds = [[Responds alloc]init];
        if (error.code == NSURLErrorTimedOut) {
            responds.resultDsec = @"请求超时";
        } else if (error.code == NSURLErrorCancelled) {
            responds.resultDsec = @"取消请求";
        }
        if (callback != nil) {
            callback(responds);
        }
    }];
}

//取消请求
- (void)cancleRequest {
    [self.dataTask cancel];
}




// 因为一个小原因 这里的网络请求不带提示器 懒得去判断 所以就搬砖一个
//POST请求
- (void)startPOSTRequest11:(NSString *)urlString parameters:(NSDictionary *)parameters completionHandler:(RequestCompletion)callback {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    // 设置超时时间
    manager.requestSerializer.timeoutInterval = 10;
    // 设置解析器
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    // 设置请求头
    [manager.requestSerializer setValue:hUUID   forHTTPHeaderField:@"DEVICE-UUID"]; // 设备的UUID
    [manager.requestSerializer setValue:@"1"    forHTTPHeaderField:@"DEVICE-MODEL"]; // 设备类型 安卓0 iOS 1
    [manager.requestSerializer setValue:hSystemVersion forHTTPHeaderField:@"DEVICE-VERSION"]; // 当前设备的系统版本
    NSDictionary * infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString * version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    [manager.requestSerializer setValue:version forHTTPHeaderField:@"APP-VERSION"]; // 当前app版本号
    
    if ([Version isEqualToString:@"商家版"]) {
        [manager.requestSerializer setValue:[Token getShopToken] forHTTPHeaderField:@"APP-TOKEN"]; //个人用户token,登录用
        NSLog(@"读取商家之后的token:%@",[Token getShopToken]);
    } else {
        [manager.requestSerializer setValue:[Token getUserToken] forHTTPHeaderField:@"APP-TOKEN"]; //个人用户token,登录用
        NSLog(@"读取用户之后的token:%@",[Token getUserToken]);
    }
    
    [manager.requestSerializer setValue:[Stamp getStamp] forHTTPHeaderField:@"STAMP"]; // 时间戳
    NSLog(@"网络请求时的时间戳：%@",[Stamp getStamp]);
    
    NSString *completionUrl = [NSString stringWithFormat:@"%@%@",[RequestUrl getRequestUrl],urlString];
    NSLog(@"服务器地址：%@",[RequestUrl getRequestUrl]);
    // 进行网络请求，并接受返回的请求任务
    // 弹框显示加载中
    
    self.dataTask = [manager POST:completionUrl parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSHTTPURLResponse * responseHeader = (NSHTTPURLResponse*)task.response;
        //        NSLog(@"Header：%@",responseHeader.allHeaderFields);
        
        NSString * stampStr = [NSString stringWithFormat:@"%@",responseHeader.allHeaderFields[@"stamp"]];
        [Stamp saveStamp:stampStr]; // 每次保存时间戳
        
        NSDictionary * response = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        //        NSLog(@"Body：%@",response);
        
        Responds * responds = [[Responds alloc]init];
        NSInteger resultCode = [response[@"status"] integerValue];
        
        
        if(resultCode == 1) {
            responds.isSuccess = YES;
            responds.responseHeaderObject = responseHeader.allHeaderFields;
            responds.resultObject = response;
            responds.resultDsec = @"获取数据成功";
        } else {
            responds.isSuccess = NO;
            responds.responseHeaderObject = nil;
            responds.resultObject = nil;
            responds.resultDsec = response[@"msg"];
            // 弹框显示失败
            //            [MBProgressHUD showError:responds.resultDsec];
            [Utils alertWithMessage:responds.resultDsec];
            NSLog(@"msg:%@",responds.resultDsec);
        }
        if (callback != nil) {
            callback(responds);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error.description);
        Responds *responds = [[Responds alloc]init];
        responds.isSuccess = NO;
        responds.responseHeaderObject = nil;
        responds.resultObject = nil;
        responds.resultDsec = error.localizedDescription;
        //判断错误编码，对不同类型的错误进行不同的处理
        // 移除HUD
//        [MBProgressHUD hideHUD];
        if (error.code == NSURLErrorTimedOut) {
            responds.resultDsec = @"请求超时";

        } else if (error.code == NSURLErrorCancelled) {
            responds.resultDsec = @"取消请求";

        } else {
            responds.resultDsec = @"请求失败";

        }
        
        if (callback != nil) {
            callback(responds);
        }
    }];
}


@end
