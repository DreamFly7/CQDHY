//
//  DefineTools.h
//  趣批油
//
//  Created by 胡隆海 on 2017/5/23.
//  Copyright © 2017年 胡隆海. All rights reserved.
//

#ifndef DefineTools_h
#define DefineTools_h


#define USER_DEFAULT         [NSUserDefaults standardUserDefaults]

#define Version              [UserAndMerchantsVersion getUserAndMerchantsVersion]

// 设备的名称
#define hDeviceName          [UIDevice currentDevice].name
// 设备的类型
#define hDeviceModel         [UIDevice currentDevice].model
// 设备的类型
#define hDiviceLocalizedModel [UIDevice currentDevice].localizedModel
// 操作系统的版本号
#define hSystemVersion       [UIDevice currentDevice].systemVersion
// 设备的UUID
#define hUUID                [UIDevice currentDevice].identifierForVendor.UUIDString

// 加密相关的key
#define passTord_Key  [NSString stringWithFormat:@"8fe6aff0fd480f591ed9e56bb63482c2"]
#define timesTamp_Key [NSString stringWithFormat:@"412f429c8f4ce36567ca1d415a336880"]
#define add_Str     [NSString stringWithFormat:@"scdhlflfdsfsdfsdjmakke"]

// 微信相关
#define WX_ACCESS_TOKEN     @"access_token"
#define WX_OPEN_ID          @"openid"
#define WX_REFRESH_TOKEN    @"refresh_token"
#define WX_BASE_URL         @"https://api.weixin.qq.com/sns"
#define WX_App_ID           @"wxb23963651d4ce2e9"
#define WX_AppSecret        @"9468ba2156de9eaf1890faa76276903b"

// 环信相关
#define kDefaultAppKey @"1412170831068516#kefuchannelapp46850"
//#define kDefaultCustomerName @"kefuchannelimid_717892"
#define kDefaultCustomerName @"kefuchannelimid_002195"
#define kDefaultCustomerNickname @"我"
#define kDefaultTenantId @"46850"
#define kDefaultProjectId @"89328"

#define kAppKey @"KF_appkey"
#define kCustomerName @"KF_name"
#define kCustomerNickname @"KF_nickname"
#define kCustomerTenantId @"KF_tenantId"
#define kCustomerProjectId @"KF_projectId"

#define fUserDefaults [NSUserDefaults standardUserDefaults]

#define hxPassWord @"123456"

#define KNOTIFICATION_ADDMSG_TO_LIST @"KNOTIFICATION_ADDMSG_TO_LIST"
#define KNOTIFICATION_LOGINCHANGE @"loginStateChange"
#define KNOTIFICATION_CHAT @"chat"
#define KNOTIFICATION_SETTINGCHANGE @"settingChange"




// token归档的路径
#define userTokenPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"userAccount.archiver"]
#define shopTokenPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"shopAccount.archiver"]
// 时间戳归档的路径
#define stampPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"stamp.archiver"]
// 用户版本&&商家版本归档的路径
#define UserAndMerchantsVersionPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"UserAndMerchantsVersion.archiver"]
// 接口归档等路径
#define RequestUrlPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"RequestUrl.archiver"]

//NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
//NSString *name = [infoDictionary objectForKey:@"CFBundleName"];
//NSString *version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
//NSString *build = [infoDictionary objectForKey:@"CFBundleVersion"];
//
// 屏幕宽、高
#define    SCREEN_W          [UIScreen mainScreen].bounds.size.width
#define    SCREEN_H          [UIScreen mainScreen].bounds.size.height
// 布局
#define UIViewWithFrame(x,y,w,h)        [[UIView alloc]         initWithFrame:CGRectMake((x), (y), (w), (h))];
#define UIImageViewWithFrame(x,y,w,h)   [[UIImageView alloc]    initWithFrame:CGRectMake((x), (y), (w), (h))];
#define UILabelWithFrame(x,y,w,h)       [[UILabel alloc]        initWithFrame:CGRectMake((x), (y), (w), (h))];
#define UITextFieldWithFrame(x,y,w,h)   [[UITextField alloc]    initWithFrame:CGRectMake((x), (y), (w), (h))];
#define UITextViewWithFrame(x,y,w,h)    [[UITextView alloc]     initWithFrame:CGRectMake((x), (y), (w), (h))];
// 字体
//不同设备的屏幕比例(当然倍数可以自己控制)
#define SizeScale ((SCREEN_H > 568) ? SCREEN_H/568 : 1)

#define hFontSize(size) ((SCREEN_H > 568) ? [UIFont systemFontOfSize:size] : [UIFont systemFontOfSize:size*0.8])

#define hBoldFontSize(size) ((SCREEN_H > 568) ? [UIFont boldSystemFontOfSize:size] : [UIFont boldSystemFontOfSize:size*0.8])

// 适配屏幕

#define ScaleWidth(width)           width/375.0*KSCREEN_WIDTH
#define ScaleHeigth(height)         height/667.0*KSCREEN_HEIGHT


// 订单里面的表格高度
#define hOrderRowH 100
#define hGoodsRowH 80

// 首页下面推荐的高度
#define RecommendedCellRowH 100
// 油库的cell高度
#define OilDepotCellRowH 100
#define FinishenOilCellRowH 100

// 默认图片
#define PlaceholderImage [UIImage imageNamed:@"qupiyou"]
// UIImage对象
#define HHImage(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]

// RGB颜色
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
// RGB颜色带透明度
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
// 添加颜色
#define HEXCOLOR(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define ColorMain                  HEXCOLOR(0x008DFA)
#define ColorFontBlack             [UIColor blackColor]
#define ColorLine                  HEXCOLOR(0xCFCFCF)
#define ColorFontGray              HEXCOLOR(0x9C9B9F)
#define ColorFontGrayLittle        HEXCOLOR(0xBBBBBB)
#define ColorFontOrange            HEXCOLOR(0xFF6117)
#define ColorBackground            HEXCOLOR(0xEEF8FD)
#define ColorWhite                 [UIColor whiteColor]
#define ColorRed                   [UIColor redColor]
#define ColorClear                 [UIColor clearColor]

// GCD

#define HHBACK(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define HHMAIN(block) dispatch_async(dispatch_get_main_queue(),block)
//GCD - 一次性执行
#define HHDISPATCH_ONCE_BLOCK(onceBlock) static dispatch_once_t onceToken; dispatch_once(&onceToken, onceBlock);
//GCD - 在Main线程上运行
#define HHDISPATCH_MAIN_THREAD(mainQueueBlock) dispatch_async(dispatch_get_main_queue(), mainQueueBlock);
//GCD - 开启异步线程
#define HHDISPATCH_GLOBAL_QUEUE_DEFAULT(globalQueueBlock) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), globalQueueBlocl);


// 判断字符串是否为空
#define NULL_STR(str) (str == nil || (NSNull *)str == [NSNull null] || str.length == 0)
// 判断字符串、数组、字典 、对象 是否为空
#define HHStringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
#define HHArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
#define HHDictIsEmpty(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)
#define HHObjectIsEmpty(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))
// 字符串相关---------------------
//字符串高度
#define HHStringHeight(string,widthLimit,font) ([string boundingRectWithSize:CGSizeMake(widthLimit, MAXFLOAT) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size.height)

//字符串宽度
#define HHStringWidth(string,font) \
({\
UILabel * label = [[UILabel alloc] initWithFrame:CGRectZero];\
label.font = font;\
label.text = string;\
[label sizeToFit];\
label.bounds.size.width;\
})

// 添加事件
#define hAddEvent(OBJ,SELECTOR)  [OBJ addTarget:self action:@selector(SELECTOR) forControlEvents:UIControlEventTouchUpInside]

// 发送通知
#define hSendNotice(NAME,userInfoDic) {\
NSNotification * notice = [NSNotification notificationWithName:NAME object:nil userInfo:userInfoDic];\
[[NSNotificationCenter defaultCenter] postNotification:notice];\
}\
// 接收通知
#define hGetNotice(NAME,SELECTOR) {\
NSNotificationCenter * center = [NSNotificationCenter defaultCenter];\
[center addObserver:self selector:@selector(SELECTOR) name:NAME object:nil];\
}\

// 界面跳转
#define hPopViewController                 [self.navigationController popViewControllerAnimated:YES]
#define hPushViewController(vc)            [self.navigationController pushViewController:vc animated:YES]
// 模态推送
#define hPresentView(vc)                   [self presentViewController:vc animated:YES completion:nil];
// 模态返回上一层界面
#define hDismissView                       [self dismissViewControllerAnimated:YES completion:nil]

// 返回按钮的设置 //view不需要拓展到整个屏幕self.edgesForExtendedLayout = UIRectEdgeNone;
#define hSetBackButton(str) {\
self.edgesForExtendedLayout = UIRectEdgeNone;\
self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:str style:UIBarButtonItemStylePlain target:self action:nil];\
[[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];\
}\
//self.navigationController.navigationBar.tintColor = [UIColor whiteColor];\
}\

// 细节: 本界面上设置, 下个界面上显示

// 手势
#define hAddGestureSingleTabWithParams(VIEW,METHOD,ISCancelsTouchesInView){\
VIEW.userInteractionEnabled = YES;\
UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(METHOD)];\
singleTap.cancelsTouchesInView = ISCancelsTouchesInView;\
[VIEW addGestureRecognizer:singleTap];\
}\

#define hAddGestureSingleTab(VIEW,METHOD){\
VIEW.userInteractionEnabled = YES;\
UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(METHOD)];\
singleTap.numberOfTapsRequired = 1;\
singleTap.numberOfTouchesRequired = 1;\
singleTap.cancelsTouchesInView = NO;\
[VIEW addGestureRecognizer:singleTap];\
}\

// Set Size
#define hSetHeight(view,h) {\
CGRect frame = view.frame;\
frame.size.height = h;\
view.frame = frame;\
}\

#define hSetWidth(view,w) {\
CGRect frame = view.frame;\
frame.size.width = w;\
view.frame = frame;\
}\

#define hSetX(view,xx) {\
CGRect frame = view.frame;\
frame.origin.x = xx;\
view.frame = frame;\
}\

#define hSetY(view,yy) {\
CGRect frame = view.frame;\
frame.origin.y = yy;\
view.frame = frame;\
}\

#define hSetRight(view,right){\
float w = view.frame.size.width;\
float x = right-w;\
CGRect frame = view.frame;\
frame.origin.x = x;\
view.frame = frame;\
}\

//边角弧度
#define hRadiusCornerWithParams(VIEW,RADIUS,BORDER_WIDTH,BORDER_COLOR) {\
CALayer *vLayer = [VIEW layer];\
[vLayer setMasksToBounds:YES];\
[vLayer setCornerRadius:RADIUS];\
[vLayer setBorderWidth:BORDER_WIDTH];\
[vLayer setBorderColor:[BORDER_COLOR CGColor]];\
}\

#define hRadiusCornerWithRadius(VIEW,RADIUS) {\
CALayer *vLayer = [VIEW layer];\
[vLayer setMasksToBounds:YES];\
[vLayer setCornerRadius:RADIUS];\
}\

#endif /* DefineTools_h */
