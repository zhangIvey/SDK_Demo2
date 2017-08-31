//
//  WB_TW776_SomethingModel.m
//  SDK_Demo
//
//  Created by yaoln on 2017/8/31.
//  Copyright © 2017年 zhangze. All rights reserved.
//

#import "WB_TW776_SomethingModel.h"

@implementation WB_TW776_SomethingModel
/*!
 * @param  param1 param2 param3 - 用来代表设置该指令需要传递的参数
 * @discussion 将要设置的参数转换成指令字符串
 */
- (instancetype)initWithParam1:(NSString *)param1 andParam2:(NSString *) param2 andParam3:(NSString *)param3
{
    self = [super init];
    if (self) {
        self.param1 = param1;
        self.param2 = param2;
        self.param3 = param3;
    }
    return self;
}

#pragma mark - super method
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
