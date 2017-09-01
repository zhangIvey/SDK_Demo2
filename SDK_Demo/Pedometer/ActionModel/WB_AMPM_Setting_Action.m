//
//  WB_AMPM_Setting_Action.m
//  SDK_Demo
//
//  Created by yaoln on 2017/9/1.
//  Copyright © 2017年 zhangze. All rights reserved.
//

#import "WB_AMPM_Setting_Action.h"

@implementation WB_AMPM_Setting_Action


- (instancetype)initWithAM:(WB_AMPM_Model *)amModel withPM:(WB_AMPM_Model *)pmModel
{
    self = [super init];
    if (self) {
        self.amModel = amModel;
        self.pmModel = pmModel;
    }
    return self;
}

- (NSString *)toOrderString
{
    return @"蓝牙可以执行的指令";
}


@end
