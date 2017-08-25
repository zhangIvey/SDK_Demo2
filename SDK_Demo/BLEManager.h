//
//  BLEManager.h
//  SDK_Demo
//
//  Created by yaoln on 2017/8/10.
//  Copyright © 2017年 zhangze. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import "FBKVOController.h"
#import "SDK_tools.h"
#import "Dascom_device.h"
#import "ResultForBLE.h"

/*
 * 蓝牙控制器
 */

//typedef enum {
//    BLE_STATE_CONNECTTING = 0, //连接成功
//    BLE_STATE_SCANNING = 1, //扫描中
//    BLE_STATE_DISCONNECTED = 2, //断开连接
//    BLE_STATE_FREE = 3 //空闲状态
//} BLE_state;

typedef  void (^ConnectBlock)(NSMutableDictionary *);


/* NSMutableDictionary result 格式定义
     |   key     |   value          |
     |  "excType"|   0/1/2          | 0: 没有异常 1：功能异常 2：数据异常
     |  "excDes" |  异常的文字描述  |
     |  "data"   |  对象object      |
 */

@interface BLEManager : NSObject

//角色实例
@property(nonatomic, strong) CBPeripheral *cPeripheral;
@property(nonatomic, strong) CBService *service;
@property(nonatomic, strong) NSMutableDictionary *characteristicsDic;

//结果实例
@property(nonatomic, copy) ConnectBlock connectBlock;

+ (BLEManager *)shareBLEManager;


- (void) scanAndConnect;//开始扫描并且默认链接

- (void) scan; //扫描
- (void) stopScan; //停止扫描
- (void) toConnnect:(CBPeripheral *)peripheral; //发起连接外设
- (void) disConnect; //和外设断开连接
- (void) error; //异常
- (void) sendMessage:(NSString *)order ToDeviceWithUUID:(NSString *)uuidString;//发送指令




@end
