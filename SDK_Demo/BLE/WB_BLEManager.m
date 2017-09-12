//
//  WB_BLEManager.m
//  SDK_Demo
//
//  Created by yaoln on 2017/8/31.
//  Copyright © 2017年 zhangze. All rights reserved.
//

#import "WB_BLEManager.h"

@interface WB_BLEManager ()<CBCentralManagerDelegate,CBPeripheralDelegate>
/*!
 * @property centralManager
 *
 * @discussion 中心蓝牙设备管理者
 *
 */
@property(nonatomic, strong) CBCentralManager *centralManager;

/*!
 * @property isAutoConnect
 *
 * @discussion 是否自动进行默认链接
 *
 */
@property(nonatomic, assign) BOOL isAutoConnect;


/*!
 * @property responseResultBlock 代码块
 *
 * @discussion 透传模式获取到数据之后的回调
 *
 */
@property(nonatomic, copy) BLE_ResponseResult responseResultBlock;


/**
 * 检查当前设置
 */
- (BOOL) checkPointAvailable;

@end

@implementation WB_BLEManager

+ (WB_BLEManager *)shareBLEManager{
    static WB_BLEManager *defaultBLEManager = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        defaultBLEManager = [[self alloc] init];
        
        //成员变量初始化 -先使用主队列进行开发
        defaultBLEManager.centralManager = [[CBCentralManager alloc] initWithDelegate:defaultBLEManager queue:nil];
        
    });
    return defaultBLEManager;
}
#pragma mark - CBPeripheralDelegate 代理方法
- (void)peripheral:(CBPeripheral *)peripheral didDiscoverServices:(nullable NSError *)error
{
    NSLog(@"发现服务");
    for (CBService *service in peripheral.services) {
        NSLog(@"service UUID = %@",[service.UUID UUIDString]);
        if ([[service.UUID UUIDString] isEqualToString:@"01021525-0138-4968-BD13-824F74BE866C"]) {
            NSLog(@"计步器服务");
            //搜索特征
            [peripheral discoverCharacteristics:nil forService:service];
        }
    }
    
}


- (void)peripheral:(CBPeripheral *)peripheral didDiscoverCharacteristicsForService:(CBService *)service error:(nullable NSError *)error
{
    NSLog(@"获取到特征");

        if ([[service.UUID UUIDString] isEqualToString:@"01021525-0138-4968-BD13-824F74BE866C"]) {
            self.cPeripheral = peripheral;
            self.service = service;
            for (CBCharacteristic *characteristic in service.characteristics) {
                NSLog(@"service.uuid = %@",[service.UUID UUIDString]);
                NSLog(@"characteristic.uuid = %@",[characteristic.UUID UUIDString]);
                if ([[characteristic.UUID UUIDString] rangeOfString:@"1526\1528"].location > 0) {
                    [self.cPeripheral setNotifyValue:YES forCharacteristic:characteristic];
                }
                [self.characteristicsDic setObject:characteristic forKey:[[characteristic UUID] UUIDString]];
            }
            NSLog(@"蓝牙外设服务特征初始化完成");
        }
    
}


- (void)peripheral:(CBPeripheral *)peripheral didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic error:(nullable NSError *)error
{
    //1526 & 1528
    
    NSLog(@"1526 & 1528接收到信息 = %@",characteristic.value);
//    self.responseResultBlock(characteristic.value);
    self.responseResultBlock(characteristic.value);
}

- (void)peripheral:(CBPeripheral *)peripheral didWriteValueForCharacteristic:(CBCharacteristic *)characteristic error:(nullable NSError *)error
{
    //1527 & 1529
    NSLog(@"写完数据的UUID .characteristic.uuid = %@",[characteristic.UUID UUIDString]);
    NSLog(@"1527 & 1529接收到信息 = %@",characteristic.value);
    
    
    
}

#pragma mark - CBCentralManagerDelegate 代理方法
//监控状态的变化
- (void)centralManagerDidUpdateState:(CBCentralManager *)central
{
    //蓝牙的设备状态
    
}

//扫描的蓝牙外设
- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary<NSString *, id> *)advertisementData RSSI:(NSNumber *)RSSI
{
    /*
     思考：所有的蓝牙外设都必须要有 name 吗？
     */
    if (peripheral.name.length <= 0) {
        return;
    }
    
    //打印参数信息
    NSLog(@"发现外部设备");
    NSLog(@"接收到的广播信息：%@",advertisementData);
    NSLog(@"蓝牙外设信息：设备identifier ： %@ 设备名称：%@ 信号强度：%@", peripheral.identifier,peripheral.name, RSSI);
    
    if ([peripheral.name rangeOfString:@"DS"].length > 0) {
        NSLog(@"得实的设备");
        self.cPeripheral = peripheral;
        self.cPeripheral.delegate = self;
        self.scanResultBlock(peripheral);
        
    }
}

/**
 中心蓝牙和某个外设连接成功。
 */
- (void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral
{
    NSLog(@"和外设链接成功");
    //01021525-0138-4968-BD13-824F74BE866C uuid
    self.connectResultBlock(YES);
    [peripheral discoverServices:nil];
    if (_characteristicsDic == nil) {
        _characteristicsDic = [[NSMutableDictionary alloc] init];
    }
    [_characteristicsDic removeAllObjects];
}


/**
 * 中心蓝牙和某个外设连接失败。
 */
- (void)centralManager:(CBCentralManager *)central didFailToConnectPeripheral:(CBPeripheral *)peripheral error:(nullable NSError *)error
{
    NSLog(@"和外设链接失败");
    //收集异常
    
}



#pragma mark - 封装的方法
/**
 * 检查当前设置
 */
- (BOOL) checkPointAvailable
{
    //蓝牙设备的状态检测
    if (self.centralManager.isScanning) {
        return YES;
    }
    
    if (self.centralManager.state == CBManagerStatePoweredOn) {
        //蓝牙可用
        return YES;
    }
    
    switch (self.centralManager.state) {
        case CBManagerStateUnknown:
            NSLog(@"未识别");
            break;
        case CBManagerStateResetting:
            NSLog(@"");
            break;
        case CBManagerStateUnsupported:
            NSLog(@"");
            break;
        case CBManagerStateUnauthorized:
            NSLog(@"");
            break;
        case CBManagerStatePoweredOff:
            NSLog(@"");
            break;
        default:
            NSLog(@"未知错误");
            break;
    }
    return NO;
}

/**
 * 开始扫描并且默认链接
 */
- (void)scanAndConnect
{
    if (![self checkPointAvailable]) {
        //不能开启
        return;
    }
    //开启扫描
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:NO],CBCentralManagerScanOptionAllowDuplicatesKey, nil];
    [self.centralManager scanForPeripheralsWithServices:nil options:options];
    self.isAutoConnect = YES;
}

/**
 * 开始扫描
 */
- (void) scan
{
    if (![self checkPointAvailable]) {
        //不能开启
        return;
    }
    //开启扫描
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:NO],CBCentralManagerScanOptionAllowDuplicatesKey, nil];
    [self.centralManager scanForPeripheralsWithServices:nil options:options];
    self.isAutoConnect = NO;
}

/**
 * 开始扫描
 */
- (void) stopScan
{
    if ([self.centralManager isScanning]) {
        [self.centralManager stopScan];
    }
    
}

/**
 * 尝试链接某一个设备
 */
- (void) toConnnect:(CBPeripheral *)peripheral
{
    //连接某个蓝牙外设
    [_centralManager connectPeripheral:peripheral options:nil];
    //设置蓝牙外设的代理；
    peripheral.delegate = self;
}

- (void) disConnect
{
    
}

- (void) error
{
    
}

- (void) sendMessage:(NSString *)order ToCharType:(NSString *)uuidString withResultBlock:(BLE_ResponseResult) resultBlock
{
    CBCharacteristic *tempCharac = (CBCharacteristic *)[self.characteristicsDic objectForKey:uuidString];
    [_cPeripheral writeValue:[Wanbu_BlueToothUtility stringToByte:order] forCharacteristic:tempCharac type:CBCharacteristicWriteWithResponse];
    self.responseResultBlock = resultBlock;
    
}


@end

