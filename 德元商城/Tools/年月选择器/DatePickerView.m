//
//  DatePickerView.m
//  趣批油
//
//  Created by 四川东汇龙科技有限公司 on 2017/8/11.
//  Copyright © 2017年 胡隆海. All rights reserved.
//

#import "DatePickerView.h"
#import "AppDelegate.h"

@interface DatePickerView () <UIPickerViewDataSource,UIPickerViewDelegate>{
    UIView *contentView;
    void(^backBlock)(NSString *);
    
    NSMutableArray * yearArray;
    NSMutableArray * monthArray;
    NSMutableArray * dayArray;
    
    NSInteger currentYear;
    NSInteger currentMonth;
    NSInteger currentDay;
    
    NSString * restr;
    
    NSString * selectedYear;
    NSString * selectecMonth;
    NSString * selectecDay;
}


@end

@implementation DatePickerView

#pragma mark - initDatePickerView
- (instancetype)initDatePackerWithResponse:(void (^)(NSString *))block{
    if (self = [super init]) {
        self.frame = [UIScreen mainScreen].bounds;
    }
    [self setViewInterface];
    if (block) {
        backBlock = block;
    }
    return self;
}

#pragma mark - ConfigurationUI
- (void)setViewInterface {
    //获取当前时间 （时间格式支持自定义）
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];//自定义时间格式
    NSString * currentDateStr = [formatter stringFromDate:[NSDate date]];
    NSLog(@"当前时间为：%@",currentDateStr);
    //拆分年月成数组
    NSArray * dateArray = [currentDateStr componentsSeparatedByString:@"-"];
    if (dateArray.count == 3) {//年 月 日
        currentYear  = [[dateArray firstObject] integerValue];
        currentMonth = [dateArray[1] integerValue];
        currentDay   = [[dateArray lastObject] integerValue];
    }
    
    selectedYear  = [NSString stringWithFormat:@"%ld",(long)currentYear];
    selectecMonth = [NSString stringWithFormat:@"%ld",(long)currentMonth];
    selectecDay   = [NSString stringWithFormat:@"%ld",(long)currentDay];
    
    //初始化年数据源数组
    yearArray = [[NSMutableArray alloc]init];
    for (NSInteger i = 1970; i <= currentYear ; i++) {
        NSString * yearStr = [NSString stringWithFormat:@"%ld年",i];
        [yearArray addObject:yearStr];
    }
    
    //初始化月数据源数组
    monthArray = [[NSMutableArray alloc]init];
    for (NSInteger i = 1 ; i <= 12; i++) {
        NSString * monthStr = [NSString stringWithFormat:@"%ld月",i];
        [monthArray addObject:monthStr];
    }
    
    //初始化日数据源数组
    dayArray = [[NSMutableArray alloc]init];
    for (NSInteger i = 1 ; i <= 31; i++) {
        NSString * dayStr = [NSString stringWithFormat:@"%ld日",i];
        [dayArray addObject:dayStr];
    }
    NSLog(@"%@",dayArray);
    
    contentView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height, self.frame.size.width, 300)];
    [self addSubview:contentView];
    //设置背景颜色为黑色，并有0.4的透明度
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
    
    //添加白色view
    UIView *whiteView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 40)];
    whiteView.backgroundColor = [UIColor whiteColor];
    [contentView addSubview:whiteView];
    
    //添加确定和取消按钮
    for (int i = 0; i < 2; i ++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake((self.frame.size.width - 60) * i, 0, 60, 40)];
        [button setTitle:i == 0 ? @"取消" : @"确定" forState:UIControlStateNormal];
        if (i == 0) {
            [button setTitleColor:[UIColor colorWithRed:97.0 / 255.0 green:97.0 / 255.0 blue:97.0 / 255.0 alpha:1] forState:UIControlStateNormal];
        } else {
            [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        }
        [whiteView addSubview:button];
        [button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 10 + i;
    }
    
    UIPickerView * pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 40, CGRectGetWidth(self.bounds), 260)];
    pickerView.delegate = self;
    pickerView.dataSource = self;
    pickerView.backgroundColor = [UIColor colorWithRed:240.0/255 green:243.0/255 blue:250.0/255 alpha:1];
    
    //设置pickerView默认选中当前时间
    [pickerView selectRow:[selectedYear integerValue] - 1970 inComponent:0 animated:YES];
    [pickerView selectRow:[selectecMonth integerValue] - 1 inComponent:1 animated:YES];
    [pickerView selectRow:[selectecDay integerValue] - 1 inComponent:2 animated:YES];
    
    [contentView addSubview:pickerView];
}

#pragma mark - Actions 
- (void)buttonTapped:(UIButton *)sender {
    if (sender.tag == 10) {
        [self dismiss];
    } else {
        if ([selectecMonth isEqualToString:@""]) {//至今的情况下 不需要中间-
            restr = [NSString stringWithFormat:@"%@%@%@",selectedYear,selectecMonth,selectecDay];
        } else {
            restr = [NSString stringWithFormat:@"%@-%@-%@",selectedYear,selectecMonth,selectecDay];
        }
        
        restr = [restr stringByReplacingOccurrencesOfString:@"年" withString:@""];
        restr = [restr stringByReplacingOccurrencesOfString:@"月" withString:@""];
        restr = [restr stringByReplacingOccurrencesOfString:@"日" withString:@""];
        
        backBlock(restr);
        [self dismiss];
    }
}

#pragma mark - pickerView出现
- (void)show {
    AppDelegate * app = [UIApplication sharedApplication].delegate;
    [app.window addSubview:self];
    [UIView animateWithDuration:0.4 animations:^{
        contentView.center = CGPointMake(self.frame.size.width/2, contentView.center.y - contentView.frame.size.height);
    }];
}
#pragma mark - pickerView消失
- (void)dismiss{
    
    [UIView animateWithDuration:0.4 animations:^{
        contentView.center = CGPointMake(self.frame.size.width/2, contentView.center.y + contentView.frame.size.height);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

#pragma mark - UIPickerViewDataSource UIPickerViewDelegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return yearArray.count;
    } else if (component == 1) {
        return monthArray.count;
    } else {
        return dayArray.count;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        return yearArray[row];
    } else if (component == 1) {
        return monthArray[row];
    } else {
        return dayArray[row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 0) {
        selectedYear = yearArray[row];
    } else if (component == 1) {
        selectecMonth = monthArray[row];
    } else {
        selectecDay   = dayArray[row];
    }
}


@end
