//
//  HttpManage.h
//  趣批油
//
//  Created by 胡隆海 on 2017/5/23.
//  Copyright © 2017年 胡隆海. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpManage : NSObject

+(id)shareInstance;

// 获取验证码
-(void)get_User_RegCodeWithParameters:(NSMutableDictionary*)dic Success:(void(^)(NSMutableDictionary * dic))block;
-(void)get_Shop_RegCodeWithParameters:(NSMutableDictionary*)dic Success:(void(^)(NSMutableDictionary * dic))block;

// 验证验证码是否正确
-(void)verify_User_CodeWithParameters:(NSMutableDictionary*)dic Success:(void(^)(NSMutableDictionary * dic))block;
-(void)verify_Shop_CodeWithParameters:(NSMutableDictionary*)dic Success:(void(^)(NSMutableDictionary * dic))block;

// 注册
-(void)reg_User_WithParameters:(NSMutableDictionary*)dic Success:(void(^)(NSMutableDictionary * dic))block;
-(void)reg_Shop_WithParameters:(NSMutableDictionary*)dic Success:(void(^)(NSMutableDictionary * dic))block;

// 登录
-(void)get_User_LoginWithParameters:(NSMutableDictionary*)dic Success:(void(^)(NSMutableDictionary * headerDic,NSMutableDictionary * dic))block;
-(void)get_Shop_LoginWithParameters:(NSMutableDictionary*)dic Success:(void(^)(NSMutableDictionary * headerDic,NSMutableDictionary * dic))block;

// 获取用户信息
- (void)get_User_InfoWithParameters:(NSMutableDictionary*)dic     Success:(void(^)(NSMutableDictionary * dic))block;
- (void)get_Shop_InfoWithParameters:(NSMutableDictionary*)dic     Success:(void(^)(NSMutableDictionary * dic))block;

// 更新用户信息
- (void)update_User_InfoWithParameters:(NSMutableDictionary*)dic  Success:(void(^)(NSMutableDictionary * dic))block;
- (void)update_Shop_InfoWithParameters:(NSMutableDictionary*)dic  Success:(void(^)(NSMutableDictionary * dic))block;

#pragma mark -- 用户版本

// 快速登录 QQ Wechat
-(void)get_Quick_LoginWithParameters:(NSMutableDictionary*)dic          Success:(void(^)(NSMutableDictionary * headerDic,NSMutableDictionary * dic))block;
// 根据电话获取用户 微信QQ登录时 绑定手机号时用
- (void)get_UserInfo_ByIphoneWithParameters:(NSMutableDictionary*)dic   Success:(void(^)(NSMutableDictionary * dic))block;
// 绑定手机号
- (void)get_BindIphone_WithParameters:(NSMutableDictionary*)dic         Success:(void(^)(NSMutableDictionary * dic))block;
// 油库商家列表
- (void)get_OilDepotList_WithParameters:(NSMutableDictionary*)dic       Success:(void(^)(NSMutableDictionary * dic))block;
// 商家的商品列表
- (void)get_OilDepotDetailList_WithParameters:(NSMutableDictionary*)dic Success:(void(^)(NSMutableDictionary * dic))block;
// 商品详情
- (void)get_OilGoodDetail_WithParameters:(NSMutableDictionary*)dic      Success:(void(^)(NSMutableDictionary * dic))block;
// 添加 购物车
- (void)get_AddCartUpdate_WithParameters:(NSMutableDictionary*)dic      Success:(void(^)(NSMutableDictionary * dic))block;
// 更新 购物车
- (void)get_UpDateCartUpdate_WithParameters:(NSMutableDictionary*)dic   Success:(void(^)(NSMutableDictionary * dic))block;
// 购物车列表
- (void)get_CartList_WithParameters:(NSMutableDictionary*)dic           Success:(void(^)(NSMutableDictionary * dic))block;
// 删除购物车商品
- (void)get_DelCart_WithParameters:(NSMutableDictionary*)dic            Success:(void(^)(NSMutableDictionary * dic))block;
// 添加/更新 收货地址
- (void)get_SaveAddress_WithParameters:(NSMutableDictionary*)dic        Success:(void(^)(NSMutableDictionary * dic))block;
// 获取地址
- (void)get_GetAddress_WithParameters:(NSMutableDictionary*)dic         Success:(void(^)(NSMutableDictionary * dic))block;
// 删除地址
- (void)get_DelAddress_WithParameters:(NSMutableDictionary*)dic         Success:(void(^)(NSMutableDictionary * dic))block;
// 取消/设置 默认地址
- (void)get_SetDefault_WithParameters:(NSMutableDictionary*)dic         Success:(void(^)(NSMutableDictionary * dic))block;
// 获取默认地址
- (void)get_DefaultAddress_WithParameters:(NSMutableDictionary*)dic     Success:(void(^)(NSMutableDictionary * dic))block;
// 创建订单
- (void)get_PlaceOrder_WithParameters:(NSMutableDictionary*)dic         Success:(void(^)(NSMutableDictionary * dic))block;
// 获取支付方式
- (void)get_GetPayType_WithParameters:(NSMutableDictionary*)dic         Success:(void(^)(NSMutableDictionary * dic))block;
// 获取订单列表
- (void)get_GetOrderList_WithParameters:(NSMutableDictionary*)dic       Success:(void(^)(NSMutableDictionary * dic))block;
// 取消订单
- (void)get_CancelOrder_WithParameters:(NSMutableDictionary*)dic        Success:(void(^)(NSMutableDictionary * dic))block;
// 新闻顶部
- (void)get_NewsTop_WithParameters:(NSMutableDictionary*)dic            Success:(void(^)(NSMutableDictionary * dic))block;
// 新闻列表
- (void)get_NewsList_WithParameters:(NSMutableDictionary*)dic           Success:(void(^)(NSMutableDictionary * dic))block;
// 新闻详情
- (void)get_NewsDetail_WithParameters:(NSMutableDictionary*)dic         Success:(void(^)(NSMutableDictionary * dic))block;

#pragma mark -- 商家版本

// 商品列表
- (void)get_Shop_OilListWithParameters:(NSMutableDictionary*)dic        Success:(void(^)(NSMutableDictionary * dic))block;
// 获取商品类型
- (void)get_Shop_GetOilTypeWithParameters:(NSMutableDictionary*)dic     Success:(void(^)(NSMutableDictionary * dic))block;
// 添加商品
- (void)get_Shop_AddOilWithParameters:(NSMutableDictionary*)dic         Success:(void(^)(NSMutableDictionary * dic))block;
// 删除商品
- (void)get_Shop_DelOilWithParameters:(NSMutableDictionary*)dic         Success:(void(^)(NSMutableDictionary * dic))block;
// 更新商品
- (void)get_Shop_EditOilWithParameters:(NSMutableDictionary*)dic        Success:(void(^)(NSMutableDictionary * dic))block;


@end
