//
//  WB_DevOpe.h
//  SDK_Demo
//
//  Created by yaoln on 2017/8/31.
//  Copyright © 2017年 zhangze. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WB_Device.h"
#import "WB_BLEManager.h"
#import "WB_AMPM_Setting_Action.h"


#pragma mark - block for every-stage

#pragma mark - class
/*!
 * @class WB_DevOpe 对使用者来说，直接进行调用的入口
 *
 * @discussion 对外提供API,对内进行各层的调度
 * 
 */
@interface WB_DevOpe : NSObject <WB_deviceDelegate>

@property(readonly, strong) WB_BLEManager *bleManager; //蓝牙控制器
@property(nonatomic, strong) NSString *typeString;

#pragma mark - 初始化
/*!
 * @method shareOperation
 *
 * @discussion : 单例对象
 *
 */
+ (WB_DevOpe *)shareOperation;


#pragma mark - 蓝牙 API

/*!
 * @method scanAndConnect
 *
 * @discussion : 扫描并且默认链接上得实设备
 *
 */
- (void)scanAndConnect;

/*!
 * @method startScan
 *
 * @discussion : 开启扫描
 *
 */
- (void)startScan;

/*!
 * @method stopScan
 *
 * @discussion : 中断扫描
 *
 */
- (void)stopScan;


/*!
 * @method toConnectPeripheral
 *
 * @discussion : 指定连接哪一台设备
 *
 */
- (void)toConnectPeripheral:(CBPeripheral *)peripheral;


/*!
 * @method  -sendOrderString
 *
 * @discussion : 向蓝牙外设发送指令
 *
 */
- (BOOL)sendOrderString:(NSString *)orderString;

#pragma mark - 得实设备的通用业务 API

/*!
 * @method  - getDeviceType:
 *
 * @discussion : 连接建立成功后，识别出设备是什么类型，什么型号的版本，然后进行对应型号的对象创建
 * 
 */
- (void)getDeviceType:(void (^)(NSString *)) block;


#pragma mark - 计步器业务 API


/*!
 * @method  - setAMPMTime：ampmSettingAction:withResult
 *
 * @discussion : 连接建立成功后，识别出设备是什么类型，什么型号的版本，然后进行对应型号的对象创建
 *
 */
- (void)setAMPMTime:(WB_AMPM_Setting_Action *)ampmSettingAction withResult:(void(^)(BOOL isSuccess)) result;

#pragma mark - 体重秤业务 API



@end
