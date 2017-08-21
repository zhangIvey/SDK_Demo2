//
//  Dascom_device.h
//  SDK_Demo
//
//  Created by yaoln on 2017/8/10.
//  Copyright © 2017年 zhangze. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 * 得实健康设备类
 */
@interface Dascom_device : NSObject

//获取设备类型
- (id)readDeviceType;

//获取设备序列号
- (id)readDeviceID;

//获取设备固件版本
- (id)readFirmwareVersion;

@end
