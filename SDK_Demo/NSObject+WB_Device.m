//
//  NSObject+WB_Device.m
//  SDK_Demo
//
//  Created by yaoln on 2017/9/8.
//  Copyright © 2017年 zhangze. All rights reserved.
//

#import "NSObject+WB_Device.h"

@implementation NSObject (WB_Device)
+ (NSString *)getDeviceType:(void (^)(WB_Device *))block
{
    WB_Device *device = [[WB_Device alloc] init];
    block(device);
    return device.modelID;
}

@end
