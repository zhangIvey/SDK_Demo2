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

/*
 * 蓝牙控制器
 */

typedef enum {
    BLE_STATE_CONNECTTING = 0, //连接成功
    BLE_STATE_SCANNING = 1, //扫描中
    BLE_STATE_DISCONNECTED = 2, //断开连接
    BLE_STATE_FREE = 3 //空闲状态
} BLE_state;



@interface BLEManager : NSObject

@property(nonatomic, assign) BLE_state state;

+ (BLEManager *)shareBLEManager;

- (void) scan; //扫描
- (void) stopScan; //停止扫描
- (void) toConnnect:(CBPeripheral *)peripheral; //发起连接外设
- (void) disConnect; //和外设断开连接
- (void) error; //异常
- (void) sendMessage:(NSString *)order ToDeviceWithUUID:(NSString *)uuidString;//发送指令




@end
