//
//  WB_BLEManager.h
//  SDK_Demo
//
//  Created by yaoln on 2017/8/31.
//  Copyright © 2017年 zhangze. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface WB_BLEManager : NSObject
//角色实例
@property(nonatomic, strong) CBPeripheral *cPeripheral;
@property(nonatomic, strong) CBService *service;
@property(nonatomic, strong) NSMutableDictionary *characteristicsDic;


+ (WB_BLEManager *)shareBLEManager;

- (void) scanAndConnect;//开始扫描并且默认链接

- (void) scan; //扫描
- (void) stopScan; //停止扫描
- (void) toConnnect:(CBPeripheral *)peripheral; //发起连接外设
- (void) disConnect; //和外设断开连接
- (void) error; //异常
- (void) sendMessage:(NSString *)order ToDeviceWithUUID:(NSString *)uuidString;//发送指令
@end
