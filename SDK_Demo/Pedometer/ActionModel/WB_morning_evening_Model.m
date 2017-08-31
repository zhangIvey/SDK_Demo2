//
//  WB_morning_evening_Model.m
//  SDK_Demo
//
//  Created by yaoln on 2017/8/31.
//  Copyright © 2017年 zhangze. All rights reserved.
//

#import "WB_morning_evening_Model.h"

@implementation WB_morning_evening_Model

/*! 
 * @method 初始化方法 
 *
 */
- (instancetype)initWithType:(SettingType) type withStartTime:(NSDate *)startTime withEndTime:(NSDate *)endTime
{
    self = [super init];
    if (self) {
        self.type       = type;
        self.startTime  = startTime;
        self.endTime    = endTime;
    }
    return self;
}

/*!
 * @method 将要设置的参数转换成指令字符串
 */
- (NSString *)toOrderString
{
    /*
     ...
     */
    return @"指令字符串";
}

@end
