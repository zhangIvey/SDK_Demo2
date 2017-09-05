//
//  WB_DevOpe.m
//  SDK_Demo
//
//  Created by yaoln on 2017/8/31.
//  Copyright © 2017年 zhangze. All rights reserved.
//

#import "WB_DevOpe.h"
#import "WB_TW776.h"
#import "WB_SW556.h"
//#import <CoreBluetooth/CoreBluetooth.h>

@interface WB_DevOpe ()

@property(nonatomic, strong) id currentDevice;
@property(nonatomic, strong) CBPeripheral *currentPeripheral;

@end

@implementation WB_DevOpe

+ (WB_DevOpe *)shareOperation{
    static WB_DevOpe *defaultOperation = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        defaultOperation = [[self alloc] init];
    });
    return defaultOperation;
}

#pragma mark - 蓝牙功能

- (void)scanAndConnect
{
    [self startScan];
}

- (void)startScan
{
    [[WB_BLEManager shareBLEManager] scan];

#pragma warning 需要重点处理的问题
    /*
     * 需要注意循环引用的问题
     */
    __weak WB_DevOpe *weakSelf = self;
    [WB_BLEManager shareBLEManager].scanResultBlock = ^(CBPeripheral *peripheral){
        NSLog(@"扫描到设备");
        _currentPeripheral = peripheral;
        NSLog(@"peripheral.name = %@",[_currentPeripheral name]);
        [weakSelf toConnectPeripheral:_currentPeripheral];
        [weakSelf stopScan];
    };
}

- (void)toConnectPeripheral:(CBPeripheral *)peripheral
{
    [[WB_BLEManager shareBLEManager] toConnnect:peripheral];
    [WB_BLEManager shareBLEManager].connectResultBlock = ^(BOOL isConnected){
        
        if (isConnected) {
            NSLog(@"block - 和外设链接成功！");
            return YES;
        }else{
            return NO;
        }
    };
}

- (void)stopScan
{
    [[WB_BLEManager shareBLEManager] stopScan];
}

- (BOOL)sendOrderString:(NSString *)orderString
{
    return YES;
}

#pragma mark - 连接上的外设读取信息后，进行拼装
/*!
 * @method  -groutingDevice
 *
 * @discussion : 连接建立成功后，识别出设备是什么类型，什么型号的版本，然后进行对应型号的对象创建
 *
 */
- (WB_Device *)groutingDeviceWithTypeName:(NSString *)typeName
{
    
//    if ([typeName isEqualToString:@"tw776"]) {
//        _currentDevice = (WB_TW776 *)[[WB_TW776 alloc] init];
//    }else if ([typeName isEqualToString:@"SW556"]){
//        _currentDevice = (WB_TW776 *)[[WB_TW776 alloc] init];
//    }
    return _currentDevice;
}

#pragma mark - 得实设备通用业务
- (NSString *)getDeviceType
{
    //判断当前设备的链接状态
    _currentDevice = (WB_Device *)[[WB_Device alloc] init];
    NSString *deviceType = [_currentDevice getDeviceType];
//    return @"tw776";
    return deviceType;
}

#pragma mark - 计步器业务
- (void)setAMPMTime:(WB_AMPM_Setting_Action *)ampmSettingAction withResult:(void(^)(BOOL isSuccess)) result;
{
    [_currentDevice setAMPMTimeSetting:ampmSettingAction];
}



@end
