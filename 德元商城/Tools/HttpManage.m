//
//  HttpManage.m
//  趣批油
//
//  Created by 胡隆海 on 2017/5/23.
//  Copyright © 2017年 胡隆海. All rights reserved.
//

#import "HttpManage.h"
#import "BaseRequest.h"
#import "Imports.h"

@implementation HttpManage

+(id)shareInstance{
    
    static HttpManage *manage = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        manage = [[self alloc] init];
    });
    
    return manage;
}

// 获取验证码
-(void)get_User_RegCodeWithParameters:(NSMutableDictionary*)dic Success:(void(^)(NSMutableDictionary * dic))block {
    [[BaseRequest sharedInstance] startPOSTRequest:User_GetRegCode parameters:dic completionHandler:^(Responds *responds) {
        if (responds.isSuccess) {
            block(responds.resultObject);
        } else {
            
        }
    }];
}

-(void)get_Shop_RegCodeWithParameters:(NSMutableDictionary*)dic Success:(void(^)(NSMutableDictionary * dic))block {
    [[BaseRequest sharedInstance] startPOSTRequest:Shop_GetRegCode parameters:dic completionHandler:^(Responds *responds) {
        if (responds.isSuccess) {
            block(responds.resultObject);
        } else {
            
        }
    }];
}

// 验证验证码是否正确
-(void)verify_User_CodeWithParameters:(NSMutableDictionary*)dic Success:(void(^)(NSMutableDictionary * dic))block {
    [[BaseRequest sharedInstance] startPOSTRequest:User_VerifyCode parameters:dic completionHandler:^(Responds *responds) {
        if (responds.isSuccess) {
            block(responds.resultObject);
        } else {
            
        }
    }];
}

-(void)verify_Shop_CodeWithParameters:(NSMutableDictionary*)dic Success:(void(^)(NSMutableDictionary * dic))block {
    [[BaseRequest sharedInstance] startPOSTRequest:Shop_VerifyCode parameters:dic completionHandler:^(Responds *responds) {
        if (responds.isSuccess) {
            block(responds.resultObject);
        } else {
            
        }
    }];
}

// 注册
-(void)reg_User_WithParameters:(NSMutableDictionary*)dic Success:(void(^)(NSMutableDictionary * dic))block {
    [[BaseRequest sharedInstance] startPOSTRequest:User_RegUser parameters:dic completionHandler:^(Responds *responds) {
        if (responds.isSuccess) {
            block(responds.resultObject);
        } else {
            
        }
    }];
}

-(void)reg_Shop_WithParameters:(NSMutableDictionary*)dic Success:(void(^)(NSMutableDictionary * dic))block {
    [[BaseRequest sharedInstance] startPOSTRequest:Shop_RegUser parameters:dic completionHandler:^(Responds *responds) {
        if (responds.isSuccess) {
            block(responds.resultObject);
        } else {
            
        }
    }];
}

// 登录
-(void)get_User_LoginWithParameters:(NSMutableDictionary*)dic Success:(void(^)(NSMutableDictionary * headerDic,NSMutableDictionary * dic))block {
    [[BaseRequest sharedInstance] startPOSTRequest:User_Login parameters:dic completionHandler:^(Responds *responds) {
        if (responds.isSuccess) {
            block(responds.responseHeaderObject,responds.resultObject);
        } else {

        }
    }];
}

-(void)get_Shop_LoginWithParameters:(NSMutableDictionary*)dic Success:(void(^)(NSMutableDictionary * headerDic,NSMutableDictionary * dic))block {
    [[BaseRequest sharedInstance] startPOSTRequest:Shop_Login parameters:dic completionHandler:^(Responds *responds) {
        if (responds.isSuccess) {
            block(responds.responseHeaderObject,responds.resultObject);
        } else {
            
        }
    }];
}

// 获取用户信息
- (void)get_User_InfoWithParameters:(NSMutableDictionary*)dic Success:(void(^)(NSMutableDictionary * dic))block {
    [[BaseRequest sharedInstance] startPOSTRequest:User_GetUserInfo parameters:dic completionHandler:^(Responds *responds) {
        if (responds.isSuccess) {
            block(responds.resultObject);
        } else {
            
        }
    }];
}

- (void)get_Shop_InfoWithParameters:(NSMutableDictionary*)dic Success:(void(^)(NSMutableDictionary * dic))block {
    [[BaseRequest sharedInstance] startPOSTRequest:Shop_GetUserInfo parameters:dic completionHandler:^(Responds *responds) {
        if (responds.isSuccess) {
            block(responds.resultObject);
        } else {
            
        }
    }];
}

// 更新用户信息
- (void)update_User_InfoWithParameters:(NSMutableDictionary*)dic Success:(void(^)(NSMutableDictionary * dic))block {
    [[BaseRequest sharedInstance] startPOSTRequest:User_UpdateUserData parameters:dic completionHandler:^(Responds *responds) {
        if (responds.isSuccess) {
            block(responds.resultObject);
        } else {
            
        }
    }];
}

- (void)update_Shop_InfoWithParameters:(NSMutableDictionary*)dic Success:(void(^)(NSMutableDictionary * dic))block {
    [[BaseRequest sharedInstance] startPOSTRequest:Shop_UpdateUserData parameters:dic completionHandler:^(Responds *responds) {
        if (responds.isSuccess) {
            block(responds.resultObject);
        } else {
            
        }
    }];
}


#pragma mark -- 用户版本

// 快速登录 QQ Wechat 相关
-(void)get_Quick_LoginWithParameters:(NSMutableDictionary*)dic Success:(void(^)(NSMutableDictionary * headerDic,NSMutableDictionary * dic))block {
    [[BaseRequest sharedInstance] startPOSTRequest:Quick_Login parameters:dic completionHandler:^(Responds *responds) {
        if (responds.isSuccess) {
            block(responds.responseHeaderObject,responds.resultObject);
        } else {
            
        }
    }];
}

// 根据电话获取用户 微信QQ登录时 绑定手机号时用
- (void)get_UserInfo_ByIphoneWithParameters:(NSMutableDictionary*)dic Success:(void(^)(NSMutableDictionary * dic))block {
    [[BaseRequest sharedInstance] startPOSTRequest:GetUserInfo parameters:dic completionHandler:^(Responds *responds) {
        if (responds.isSuccess) {
            block(responds.resultObject);
        } else {
            
        }
    }];
}

// 绑定手机号
- (void)get_BindIphone_WithParameters:(NSMutableDictionary*)dic Success:(void(^)(NSMutableDictionary * dic))block {
    [[BaseRequest sharedInstance] startPOSTRequest:BindIphone parameters:dic completionHandler:^(Responds *responds) {
        if (responds.isSuccess) {
            block(responds.resultObject);
        } else {
            
        }
    }];
}

// 油库商家列表
- (void)get_OilDepotList_WithParameters:(NSMutableDictionary*)dic Success:(void(^)(NSMutableDictionary * dic))block {
    [[BaseRequest sharedInstance] startPOSTRequest:OilDepotList parameters:dic completionHandler:^(Responds *responds) {
        if (responds.isSuccess) {
            block(responds.resultObject);
        } else {
            
        }
    }];
}

// 商家的商品列表
- (void)get_OilDepotDetailList_WithParameters:(NSMutableDictionary*)dic Success:(void(^)(NSMutableDictionary * dic))block {
    [[BaseRequest sharedInstance] startPOSTRequest:OilDepotDetailList parameters:dic completionHandler:^(Responds *responds) {
        if (responds.isSuccess) {
            block(responds.resultObject);
        } else {
            
        }
    }];
}

// 商品详情
- (void)get_OilGoodDetail_WithParameters:(NSMutableDictionary*)dic Success:(void(^)(NSMutableDictionary * dic))block {
    [[BaseRequest sharedInstance] startPOSTRequest:OilGoodDetail parameters:dic completionHandler:^(Responds *responds) {
        if (responds.isSuccess) {
            block(responds.resultObject);
        } else {
            
        }
    }];
}

// 添加 购物车
- (void)get_AddCartUpdate_WithParameters:(NSMutableDictionary*)dic Success:(void(^)(NSMutableDictionary * dic))block {
    [[BaseRequest sharedInstance] startPOSTRequest:AddCartUpdate parameters:dic completionHandler:^(Responds *responds) {
        if (responds.isSuccess) {
            block(responds.resultObject);
        } else {
            
        }
    }];
}

//更新 购物车
- (void)get_UpDateCartUpdate_WithParameters:(NSMutableDictionary*)dic Success:(void(^)(NSMutableDictionary * dic))block {
    [[BaseRequest sharedInstance] startPOSTRequest11:AddCartUpdate parameters:dic completionHandler:^(Responds *responds) {
        if (responds.isSuccess) {
            block(responds.resultObject);
        } else {
            
        }
    }];
}

// 购物车列表
- (void)get_CartList_WithParameters:(NSMutableDictionary*)dic Success:(void(^)(NSMutableDictionary * dic))block {
    [[BaseRequest sharedInstance] startPOSTRequest:CartList parameters:dic completionHandler:^(Responds *responds) {
        if (responds.isSuccess) {
            block(responds.resultObject);
        } else {
            
        }
    }];
}

// 删除购物车商品
- (void)get_DelCart_WithParameters:(NSMutableDictionary*)dic Success:(void(^)(NSMutableDictionary * dic))block {
    [[BaseRequest sharedInstance] startPOSTRequest11:DelCart parameters:dic completionHandler:^(Responds *responds) {
        if (responds.isSuccess) {
            block(responds.resultObject);
        } else {
            
        }
    }];
}

// 添加/更新 收货地址
- (void)get_SaveAddress_WithParameters:(NSMutableDictionary*)dic Success:(void(^)(NSMutableDictionary * dic))block {
    [[BaseRequest sharedInstance] startPOSTRequest:SaveAddress parameters:dic completionHandler:^(Responds *responds) {
        if (responds.isSuccess) {
            block(responds.resultObject);
        } else {
            
        }
    }];
}

// 获取地址
- (void)get_GetAddress_WithParameters:(NSMutableDictionary*)dic Success:(void(^)(NSMutableDictionary * dic))block {
    [[BaseRequest sharedInstance] startPOSTRequest11:GetAddress parameters:dic completionHandler:^(Responds *responds) {
        if (responds.isSuccess) {
            block(responds.resultObject);
        } else {
            
        }
    }];
}

// 删除地址
- (void)get_DelAddress_WithParameters:(NSMutableDictionary*)dic Success:(void(^)(NSMutableDictionary * dic))block {
    [[BaseRequest sharedInstance] startPOSTRequest:DelAddress parameters:dic completionHandler:^(Responds *responds) {
        if (responds.isSuccess) {
            block(responds.resultObject);
        } else {
            
        }
    }];
}

// 取消/设置 默认地址
- (void)get_SetDefault_WithParameters:(NSMutableDictionary*)dic Success:(void(^)(NSMutableDictionary * dic))block {
    [[BaseRequest sharedInstance] startPOSTRequest11:SetDefault parameters:dic completionHandler:^(Responds *responds) {
        if (responds.isSuccess) {
            block(responds.resultObject);
        } else {
            
        }
    }];
}

// 获取默认地址
- (void)get_DefaultAddress_WithParameters:(NSMutableDictionary*)dic Success:(void(^)(NSMutableDictionary * dic))block {
    [[BaseRequest sharedInstance] startPOSTRequest11:DefaultAddress parameters:dic completionHandler:^(Responds *responds) {
        if (responds.isSuccess) {
            block(responds.resultObject);
        } else {
            
        }
    }];
}

// 创建订单
- (void)get_PlaceOrder_WithParameters:(NSMutableDictionary*)dic Success:(void(^)(NSMutableDictionary * dic))block {
    [[BaseRequest sharedInstance] startPOSTRequest11:PlaceOrder parameters:dic completionHandler:^(Responds *responds) {
        if (responds.isSuccess) {
            block(responds.resultObject);
        } else {
            
        }
    }];
}

// 获取支付方式
- (void)get_GetPayType_WithParameters:(NSMutableDictionary*)dic Success:(void(^)(NSMutableDictionary * dic))block {
    [[BaseRequest sharedInstance] startPOSTRequest11:GetPayType parameters:dic completionHandler:^(Responds *responds) {
        if (responds.isSuccess) {
            block(responds.resultObject);
        } else {
            
        }
    }];
}
// 获取订单列表
- (void)get_GetOrderList_WithParameters:(NSMutableDictionary*)dic Success:(void(^)(NSMutableDictionary * dic))block {
    [[BaseRequest sharedInstance] startPOSTRequest:GetOrderList parameters:dic completionHandler:^(Responds *responds) {
        if (responds.isSuccess) {
            block(responds.resultObject);
        } else {
            
        }
    }];
}

// 取消订单
- (void)get_CancelOrder_WithParameters:(NSMutableDictionary*)dic Success:(void(^)(NSMutableDictionary * dic))block {
    [[BaseRequest sharedInstance] startPOSTRequest:CancelOrder parameters:dic completionHandler:^(Responds *responds) {
        if (responds.isSuccess) {
            block(responds.resultObject);
        } else {
            
        }
    }];
}

// 新闻顶部
- (void)get_NewsTop_WithParameters:(NSMutableDictionary*)dic Success:(void(^)(NSMutableDictionary * dic))block {
    [[BaseRequest sharedInstance] startPOSTRequest11:NewsTop parameters:dic completionHandler:^(Responds *responds) {
        if (responds.isSuccess) {
            block(responds.resultObject);
        } else {
            
        }
    }];
}
// 新闻列表
- (void)get_NewsList_WithParameters:(NSMutableDictionary*)dic Success:(void(^)(NSMutableDictionary * dic))block {
    [[BaseRequest sharedInstance] startPOSTRequest:NewsList parameters:dic completionHandler:^(Responds *responds) {
        if (responds.isSuccess) {
            block(responds.resultObject);
        } else {
            
        }
    }];
}

// 新闻详情
- (void)get_NewsDetail_WithParameters:(NSMutableDictionary*)dic Success:(void(^)(NSMutableDictionary * dic))block {
    [[BaseRequest sharedInstance] startPOSTRequest:NewsDetail parameters:dic completionHandler:^(Responds *responds) {
        if (responds.isSuccess) {
            block(responds.resultObject);
        } else {
            
        }
    }];
}


#pragma mark -- 商家版本

// 商品列表
- (void)get_Shop_OilListWithParameters:(NSMutableDictionary*)dic Success:(void(^)(NSMutableDictionary * dic))block {
    [[BaseRequest sharedInstance] startPOSTRequest:Shop_OilList parameters:dic completionHandler:^(Responds *responds) {
        if (responds.isSuccess) {
            block(responds.resultObject);
        } else {
            
        }
    }];
}

// 获取商品类型
- (void)get_Shop_GetOilTypeWithParameters:(NSMutableDictionary*)dic Success:(void(^)(NSMutableDictionary * dic))block {
    [[BaseRequest sharedInstance] startPOSTRequest:Shop_GetOilType parameters:dic completionHandler:^(Responds *responds) {
        if (responds.isSuccess) {
            block(responds.resultObject);
        } else {
            
        }
    }];
}

// 添加商品
- (void)get_Shop_AddOilWithParameters:(NSMutableDictionary*)dic Success:(void(^)(NSMutableDictionary * dic))block {
    [[BaseRequest sharedInstance] startPOSTRequest:Shop_AddOil parameters:dic completionHandler:^(Responds *responds) {
        if (responds.isSuccess) {
            block(responds.resultObject);
        } else {
            
        }
    }];
}

// 删除商品
- (void)get_Shop_DelOilWithParameters:(NSMutableDictionary*)dic Success:(void(^)(NSMutableDictionary * dic))block {
    [[BaseRequest sharedInstance] startPOSTRequest:Shop_DelOil parameters:dic completionHandler:^(Responds *responds) {
        if (responds.isSuccess) {
            block(responds.resultObject);
        } else {
            
        }
    }];
}


// 编辑商品
- (void)get_Shop_EditOilWithParameters:(NSMutableDictionary*)dic Success:(void(^)(NSMutableDictionary * dic))block {
    [[BaseRequest sharedInstance] startPOSTRequest:Shop_EditOil parameters:dic completionHandler:^(Responds *responds) {
        if (responds.isSuccess) {
            block(responds.resultObject);
        } else {
            
        }
    }];
}




@end
