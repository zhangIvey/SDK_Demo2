//
//  Pedometer_device.h
//  SDK_Demo
//
//  Created by yaoln on 2017/8/10.
//  Copyright © 2017年 zhangze. All rights reserved.
//

#import "Dascom_device.h"
/*
 * 得实的计步器设备
 */
@interface Pedometer_device : Dascom_device

//天数据
- (id)getDayRecord;

//配置信息
- (id)getSettingRecord;

@end
