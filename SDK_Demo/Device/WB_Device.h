//
//  WB_Device.h
//  SDK_Demo
//
//  Created by yaoln on 2017/8/31.
//  Copyright © 2017年 zhangze. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WB_BLEManager.h"


/*!
 * @enum DeviceType 万步网健康设备类型，比如：计步器，血压计，血糖仪，体温计等等
 *
 *
 */
typedef enum {
    DEVICE_TYPE_PEDO   = 0,   //计步器
    DEVICE_TYPE_SCALE  = 1,   //体重秤
    DEVICE_TYPE_BLOOD  = 2,   //血压计
    DEVICE_TYPE_UNKOWN = -1   //不认识的设备
} DeviceType;

/*!
 * @class WB_Device 万步网健康设备
 *
 *
 */
@interface WB_Device : NSObject

@property(nonatomic, assign)    DeviceType type;                //健康设备类型
@property(nonatomic, copy)      NSString *modelID;              //设备型号
@property(nonatomic, assign)    unsigned int firmwareVersion;   //设备的固件版本号


@end
