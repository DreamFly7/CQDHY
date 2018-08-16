//
//  SexPickerView.h
//  趣批油
//
//  Created by 四川东汇龙科技有限公司 on 2017/8/11.
//  Copyright © 2017年 胡隆海. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SexPickerView : UIView


- (instancetype)initDatePackerWithResponse:(void(^)(NSString*))block;

- (void)show;

@end
