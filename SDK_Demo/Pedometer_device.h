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

#pragma mark - 业务管理
/*
 *  配置朝三信息
 */
- (id)setSanInfo:(NSDate *)startTime and:(NSDate *)endTime;

@end
