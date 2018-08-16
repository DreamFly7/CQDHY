//
//  SexPickerView.m
//  趣批油
//
//  Created by 四川东汇龙科技有限公司 on 2017/8/11.
//  Copyright © 2017年 胡隆海. All rights reserved.
//

#import "SexPickerView.h"
#import "AppDelegate.h"

@interface SexPickerView () <UIPickerViewDataSource,UIPickerViewDelegate>{
    UIView *contentView;
    void(^backBlock)(NSString *);
    
    NSArray * sexArray;
    NSInteger currentSex;
    NSString * restr;
    NSString * selectedSex;
}


@end

@implementation SexPickerView

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
    //初始化数据源数组
    sexArray = [[NSArray alloc]init];
    sexArray = @[@"男",@"女"];
    currentSex = [[sexArray firstObject]integerValue];
    selectedSex = [NSString stringWithFormat:@"%@",sexArray[0]];
    
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
    
    UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 40, CGRectGetWidth(self.bounds), 260)];
    pickerView.delegate = self;
    pickerView.dataSource = self;
    pickerView.backgroundColor = [UIColor colorWithRed:240.0/255 green:243.0/255 blue:250.0/255 alpha:1];
    
    //设置pickerView默认选中当前时间
    [pickerView selectRow:0 inComponent:0 animated:YES];
    
    [contentView addSubview:pickerView];
}

#pragma mark - Actions
- (void)buttonTapped:(UIButton *)sender {
    if (sender.tag == 10) {
        [self dismiss];
    } else {
        restr = [NSString stringWithFormat:@"%@",selectedSex];
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
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return sexArray.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return sexArray[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    selectedSex = sexArray[row];
}


@end
