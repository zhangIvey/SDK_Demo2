//
//  Dascom_device.h
//  SDK_Demo
//
//  Created by yaoln on 2017/8/10.
//  Copyright © 2017年 zhangze. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import "Order_operaiton.h"
#import "BLEManager.h"
#import "tw776_device.h"

/*
 * 得实健康设备类
 */
typedef enum {
    DEVICE_PEDO = 0,//计步器;
    DEVICE_TEMPERATURE = 1 //体温计
} DeviceType;


typedef enum {
    BLE_STATE_CONNECTTING = 0, //连接成功
    BLE_STATE_SCANNING = 1, //扫描中
    BLE_STATE_DISCONNECTED = 2, //断开连接
    BLE_STATE_FREE = 3 //空闲状态
} BLE_state;


/*
 *  返回状态定义block
 */


@interface Dascom_device : NSObject

//基本属性
@property(nonatomic, assign)    DeviceType   type;          //设备类型
@property(nonatomic, copy)      NSString    *supClassName;
@property(nonatomic, copy)      NSString    *deviceModel;   //设备型号
@property(nonatomic, copy)      NSString    *deviceID;      //设备序列号
@property(nonatomic, copy)      NSString    *firmWareVer;   //固件版本

//代码块回调



#pragma mark - 蓝牙管理
/*
 *  开启蓝牙扫描，并连接上设备
 */
- (void)makeCommunicationWithDevice;//Demo

- (void)scan;
- (void)toConnect;


#pragma mark - 业务管理
//获取设备类型
- (id)readDeviceType;

////获取设备序列号
- (id)readDeviceID;

////获取设备固件版本
- (id)readFirmwareVersion;

@end
