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



@interface WB_DevOpe () <WB_BLEManagerDelegate>


@property(nonatomic, strong) CBPeripheral   *currentPeripheral;


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
     *
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
- (void)groutingDevice
{
    __block NSString *type;
    [self getDeviceType:^(NSString *typeName){
        type = typeName;
        if ([typeName isEqualToString:@"TW776"]) {
            _currentDevice = [[WB_TW776 alloc] init];
        }
    }];
    //固件版本号
//    [self getModelID:^(NSString *modelString){
//        if (_currentDevice != nil) {
//            _currentDevice.modelID = modelString;
//        }
//    }]
    
    
}


#pragma mark - 得实设备通用业务
- (void)getDeviceType:(void (^)(NSString *)) block
{
    //判断当前设备的链接状态
    WB_Device *temp = [[WB_Device alloc] init];
    __block WB_Device *device = temp;
    [device getDeviceType:^(NSString *typeString){
        NSLog(@"WB_DevOpe typeString = %@",typeString);
        block(typeString);
    }];
}


#pragma mark - 计步器业务
- (void)setAMPMTime:(WB_AMPM_Setting_Action *)ampmSettingAction withResult:(void(^)(BOOL isSuccess)) result;
{
    NSLog(@"设备类型： %@",[_currentDevice modelID]);
    
    id pedo = (id)_currentDevice;
    NSLog(@"设备类型： %@",[pedo modelID]);
    [pedo setAMPMTimeSetting:ampmSettingAction withBlock:result];
}

#pragma mark - 数据异常监听
- (void)receiveException:(WB_Exception *)exception
{
    NSLog(@"提醒信息 ： %@",exception.warnningString);
    NSLog(@"出了一个异常");
    //将问题反馈给调用者
    if (_delegate) {
        [_delegate recevicedAbnormal:exception.warnningString];
    }
}

- (void)receviedAbnormal:(NSString *)message
{
    if (_delegate) {
        [_delegate recevicedAbnormal:message];
    }
}

@end
