//
//  Define.h
//  趣批油
//
//  Created by 胡隆海 on 2017/5/23.
//  Copyright © 2017年 胡隆海. All rights reserved.
//

#ifndef Define_h
#define Define_h

// 正式服务器
//#define RequestURL                  @""
// 测试服务器
//#define RequestURL              @"http://192.168.2.183:82" 利用归档保存的

// 获取验证码
#define User_GetRegCode         @"/user/getCode"
#define Shop_GetRegCode         @"/shop/getCode"

// 验证 (注册|重置)验证码
#define User_VerifyCode         @"/user/verifyCode"
#define Shop_VerifyCode         @"/shop/verifyCode"

// 注册用户
#define User_RegUser            @"/user/reg"
#define Shop_RegUser            @"/shop/reg"

// 登录
#define User_Login              @"/user/login"
#define Shop_Login              @"/shop/login"

// 更新用户信息
#define User_UpdateUserData     @"/userinfo/up"
#define Shop_UpdateUserData     @"/shop/up"

// 获取用户信息
#define User_GetUserInfo        @"/userinfo/get"
#define Shop_GetUserInfo        @"/shop/getInfo"

//--------------用户版--------------

// 第三方登录
// 绑定手机号相关接口
#define Quick_Login             @"/user/quickLogin"
// 根据电话获取用户
#define GetUserInfo             @"/user/getUserByTel"
// 绑定手机号
#define BindIphone              @"/user/bindQuickLogin"
// 油库商家列表
#define OilDepotList            @"/oil/shoplst"
// 商家的商品列表
#define OilDepotDetailList      @"/oil/oillst"
// 商品详情
#define OilGoodDetail           @"/oil/detail"
// 添加/更新 购物车
#define AddCartUpdate           @"/cart/save"
// 购物车列表
#define CartList                @"/cart/lst"
// 删除购物车商品
#define DelCart                 @"/cart/del"
// 添加/更新 收货地址
#define SaveAddress             @"/addr/save"
// 获取地址
#define GetAddress              @"/addr/lst"
// 删除地址
#define DelAddress              @"/addr/del"
// 取消/设置 默认地址
#define SetDefault              @"/addr/setDefault"
// 获取默认地址
#define DefaultAddress          @"/addr/getDefault"
// 创建订单
#define PlaceOrder              @"/order/add"
// 获取支付方式
#define GetPayType              @"/order/paytype"
// 获取订单列表
#define GetOrderList            @"/order/lst"
// 取消订单
#define CancelOrder             @"/order/cancle"
// 新闻顶部
#define NewsTop                 @"/news/top"
// 新闻列表
#define NewsList                @"/news/lst"
// 新闻详情
#define NewsDetail              @"/news/detail"



//--------------商家版--------------

// 商品列表
#define Shop_OilList            @"/oil/lst"

// 获取商品类型
#define Shop_GetOilType         @"/oil/type"

// 添加商品
#define Shop_AddOil             @"/oil/add"

// 删除商品
#define Shop_DelOil             @"/oil/del"

// 编辑商品
#define Shop_EditOil            @"/oil/edit"


#endif /* Define_h */
