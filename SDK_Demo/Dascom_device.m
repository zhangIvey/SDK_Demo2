//
//  Dascom_device.m
//  SDK_Demo
//
//  Created by yaoln on 2017/8/10.
//  Copyright © 2017年 zhangze. All rights reserved.
//

#import "Dascom_device.h"
#import "tw776_device.h"

@interface  Dascom_device()
//关联硬件外设
@property(nonatomic, strong) CBPeripheral           *das_peripheral;    //建立连接的得实设备
@property(nonatomic, strong) CBService              *das_service;       //得实的服务
@property(nonatomic, strong) NSMutableDictionary    *das_charas;        //得实的四个特征

//功能上的应用实例
@property(nonatomic, strong) Order_operaiton        *orderOper;         //指令拼接操作类
@end

@implementation Dascom_device


#pragma mark - message translate
- (BOOL)resolveInstanceMethod
{
    return YES;
}

- (id)forwardingTargetForSelector:(SEL)aSelector

{
    if (aSelector == @selector(doSomethingElse))
    {
        NSLog(@"TW776_device去执行");
        tw776_device *tw776 = [[tw776_device alloc] init];
        return [tw776 doSomethingElse];
    }
    return @"无响应";
}

#pragma mark - instance's life's circle;
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}


#pragma mark - 蓝牙管理
//扫描 + 默认链接上蓝牙设备
- (void)makeCommunicationWithDevice
{
    [[BLEManager shareBLEManager] scanAndConnect]; //扫描，并且进行连接
    [BLEManager shareBLEManager].connectBlock = ^(NSMutableDictionary *resultDic){
        //异常解析
        if ([[resultDic valueForKey:@"excType"] intValue] > 0) {
            [resultDic valueForKey:@"excDes"];
            NSLog(@"异常信息:%@",[resultDic valueForKey:@"excDes"]);
            return ;
        }
        NSLog(@"链接成功");
        
    };
}
- (BOOL)check{
    return YES;
}

//获取设备类型
- (id)readDeviceType
{
    //
    NSString *string = @"阿斯顿发生";
    //判断链接状态
//    [[BLEManager shareBLEManager] sendMessage:<#(NSString *)#> ToDeviceWithUUID:<#(NSString *)#>];
//    [BLEManager shareBLEManager].shareBLEManager= ^(){
//        //解析类解析
//        [self check];
//    }
    return nil;
}






@end
