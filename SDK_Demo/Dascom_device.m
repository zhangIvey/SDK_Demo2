//
//  Dascom_device.m
//  SDK_Demo
//
//  Created by yaoln on 2017/8/10.
//  Copyright © 2017年 zhangze. All rights reserved.
//

#import "Dascom_device.h"


@interface  Dascom_device()

@end

@implementation Dascom_device


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.bleManager = [BLEManager shareBLEManager];
    }
    return self;
}
#pragma mark - 蓝牙管理
//扫描 + 默认链接上蓝牙设备
- (void)makeCommunicationWithDevice
{
    [self.bleManager scanAndConnect]; //扫描，并且进行连接
    
}




@end
