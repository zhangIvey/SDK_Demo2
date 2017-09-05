//
//  WB_BLEManager.h
//  SDK_Demo
//
//  Created by yaoln on 2017/8/31.
//  Copyright © 2017年 zhangze. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import "Wanbu_BlueToothUtility.h"


#pragma mark - charactics means types


#pragma mark - block for every-stage
/*!
 *  : 开启蓝牙扫描后的回调
 *
 */
typedef void (^BLE_ScanResult)(CBPeripheral *);

/*!
 *  : 链接蓝牙设备的回调方法
 *
 */
typedef BOOL (^BLE_ConnectResult)(BOOL);


/*!
 *  : 接收到蓝牙外设应答的回调方法
 *
 */
typedef void (^BLE_ResponseResult)(NSData *data);

/*!
 *  : 接收到蓝牙外设应答的回调方法,携带返回值
 *
 */
typedef id (^BLE_ResponseResultWithReturn)(NSData *data);

/*!
 *  : 接收到设置朝朝暮暮应答的回调方法
 *
 */
typedef void (^BLE_AMPMSettingResult)();

#pragma mark - class for blueTooth
/*!
 * @class WB_BLEManager 蓝牙功能类，单例
 *
 * @discussion 对 WB_DevOpe 提供服务
 *
 */
@interface WB_BLEManager : NSObject


#pragma mark - properties
@property(nonatomic, strong) CBPeripheral *cPeripheral;
@property(nonatomic, strong) CBService *service;
@property(nonatomic, strong) NSMutableDictionary *characteristicsDic;

#pragma mark - 蓝牙功能的block
/*!
 * @property scanResultBlock 代码块
 *
 * @discussion 扫描到的蓝牙设备
 *
 */
@property(nonatomic, copy) BLE_ScanResult scanResultBlock;

/*!
 * @property connectResultBlock 代码块
 *
 * @discussion 指定去链接一个蓝牙设备
 *
 */
@property(nonatomic, copy) BLE_ConnectResult connectResultBlock;




#pragma mark - 业务数据的回调block
/*!
 * @property responseResultBlock 代码块
 *
 * @discussion 透传模式获取到数据之后的回调, 提供给WB_Pedometer使用
 * @see WB_Pedometer
 */
//@property(nonatomic, copy) BLE_AMPMSettingResult ampmSettingResultBlock;


#pragma mark - 蓝牙功能
/*!
 * @method - shareBLEManager
 *
 * @discussion : 单例对象
 *
 */
+ (WB_BLEManager *)shareBLEManager;

/*!
 * @method - scanAndConnect
 *
 * @discussion : 开始扫描并且默认链接
 *
 */
- (void) scanAndConnect;


/*!
 * @method - scan
 *
 * @discussion : 开始扫描
 *
 */
- (void) scan;


/*!
 * @method - stopScan
 *
 * @discussion : 终止扫描
 *
 */
- (void) stopScan;

/*!
 * @method - toConnnect:peripheral
 *
 * @discussion : 指定连接某一个蓝牙外设
 *
 */
- (void) toConnnect:(CBPeripheral *)peripheral;

/*!
 * @method - disConnect
 *
 * @discussion : 和外设断开连接
 *
 */
- (void) disConnect;

/*!
 * @method - error
 *
 * @discussion : 错误
 *
 */
- (void) error;

/*!
 * @method - sendMessage:order ToDeviceWithUUID:uuidString
 *
 * @discussion : 向制定的特征UUID发送指令
 *
 */
- (void) sendMessage:(NSString *)order ToCharType:(NSString *)uuidString withResultBlock:(BLE_ResponseResult) resultBlock;//发送指令

//- (void) sendMessage:(NSString *)order ToCharType:(NSString *)uuidString withResultBlock:(BLE_ResponseResultWithReturn) resultBlock;//发送指令
@end
