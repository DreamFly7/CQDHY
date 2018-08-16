//
//  YearDatePickerView.h
//  趣批油
//
//  Created by 四川东汇龙科技有限公司 on 2017/7/4.
//  Copyright © 2017年 胡隆海. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YearDatePickerView : UIView

- (instancetype)initDatePackerWithResponse:(void(^)(NSString*))block;

- (void)show;

@end
