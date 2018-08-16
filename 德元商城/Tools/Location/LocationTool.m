//
//  LocationTool.m
//  趣批油
//
//  Created by 四川东汇龙科技有限公司 on 2017/6/16.
//  Copyright © 2017年 胡隆海. All rights reserved.
//

#import "LocationTool.h"
#import <CoreLocation/CoreLocation.h>

@interface LocationTool ()<CLLocationManagerDelegate>
@property (nonatomic, strong) CLLocationManager * locationManager;
@property (nonatomic, strong) NSDictionary * locationDicData;
@end

@implementation LocationTool

static dispatch_once_t once;
static id sharedInstance;

+(instancetype)sharedInstance{
    
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

+ (void)tearDown{
    sharedInstance=nil;
    once=0l;
}

#pragma mark -- LoactionEvent定位相关
// 定位功能
- (void)locationToolEvent {
    //检测定位功能是否开启
    if([CLLocationManager locationServicesEnabled]){
        
        if(!_locationManager){
            
            self.locationManager = [[CLLocationManager alloc] init];
            
            if([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]){
                [self.locationManager requestWhenInUseAuthorization];
                [self.locationManager requestAlwaysAuthorization];
            }
            
            //设置代理
            [self.locationManager setDelegate:self];
            //设置定位精度
            [self.locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
            //设置距离筛选
            [self.locationManager setDistanceFilter:100];
            //开始定位
            [self.locationManager startUpdatingLocation];
            //设置开始识别方向
            [self.locationManager startUpdatingHeading];
            
        }
        
    } else {
        
        
    }
}

#pragma mark -- CLLocationManagerDelegate
//定位成功以后调用
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    [self.locationManager stopUpdatingLocation];
    CLLocation* location = locations.lastObject;
    [self reverseGeocoder:location];
    
}

//反地理编码
- (void)reverseGeocoder:(CLLocation *)currentLocation {
    
    CLGeocoder* geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        
        //        NSLog(@"array == %@",placemarks);
        
        if(error || placemarks.count == 0){
            NSLog(@"error = %@",error);
        }else{
            CLPlacemark* placemark = placemarks.firstObject;
            NSLog(@"定位参数 == %@",[placemark addressDictionary]);
            NSLog(@"placemark:%@",[[placemark addressDictionary] objectForKey:@"Street"]);
            
            _locationDicData = [placemark addressDictionary];
            
            NSLog(@"城市-City：%@",_locationDicData[@"City"]);
            NSLog(@"国家-Country:%@",_locationDicData[@"Country"]);
            NSLog(@"国家代码-CountryCode:%@",_locationDicData[@"CountryCode"]);
            NSLog(@"详细地址-FormattedAddressLines:%@",_locationDicData[@"FormattedAddressLines"][0]);
            NSLog(@"街道-Name:%@",_locationDicData[@"Name"]);
            NSLog(@"省名-State：%@",_locationDicData[@"State"]);
            NSLog(@"街道-Street：%@",_locationDicData[@"Street"]);
            NSLog(@"区县-SubLocality：%@",_locationDicData[@"SubLocality"]);
            NSLog(@"街道号-SubThoroughfare：%@",_locationDicData[@"SubThoroughfare"]);
            NSLog(@"街道名称-Thoroughfare：%@",_locationDicData[@"Thoroughfare"]);
            
            //创建一个消息对象
            NSNotification * notice = [NSNotification notificationWithName:@"location" object:nil userInfo:@{@"locationDic":_locationDicData}];
            //发送消息 发到 GasStationLocationVC OilDepotVC界面
            [[NSNotificationCenter defaultCenter] postNotification:notice];
        }
    }];
}

// 返回各个城市编码
+ (NSMutableDictionary *)getCityCodeEventWithState:(NSString *)State WithCity:(NSString *)City WithSubLocality:(NSString *)SubLocality {

    NSString * pathStr = [[NSBundle mainBundle] pathForResource:@"CityCodeData" ofType:nil];
    NSData * data = [NSData dataWithContentsOfFile:pathStr];
    NSDictionary * json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSMutableArray * cityCodeData = [NSMutableArray arrayWithArray:json[@"cityCodeData"]];
    NSLog(@"城市编码数据：%@",data);
    NSLog(@"城市编码数据：%@",json);
    NSMutableDictionary * cityCodeDic = [NSMutableDictionary dictionary];
    
    for (NSInteger index = 0; index < cityCodeData.count; index++) {
        if ([State isEqualToString:cityCodeData[index][@"text"]]) { // 省份
            NSMutableArray * cityArray = [NSMutableArray array];
            cityArray = [cityCodeData[index][@"children"] copy]; // 取出省份下面的市区
            [cityCodeDic setValue:cityCodeData[index][@"value"] forKey:@"stateCode"];
            
            for (NSInteger index = 0; index < cityArray.count; index++) {
                if ([City isEqualToString:cityArray[index][@"text"]]) { // 城市
                    NSMutableArray * subLocalityArray = [NSMutableArray array];
                    subLocalityArray = [cityArray[index][@"children"] copy]; // 取出城市下面的区
                    [cityCodeDic setValue:cityArray[index][@"value"] forKey:@"cityCode"];
                    
                    for (NSInteger index = 0; index < subLocalityArray.count; index++) {
                        if ([SubLocality isEqualToString:subLocalityArray[index][@"text"]]) { // 区
                            [cityCodeDic setValue:subLocalityArray[index][@"value"] forKey:@"subLocalityCode"];
                        }
                    }
                }
            }
        }
    }
    return cityCodeDic;
}

@end
