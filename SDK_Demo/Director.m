//
//  Director.m
//  SDK_Demo
//
//  Created by yaoln on 2017/8/10.
//  Copyright © 2017年 zhangze. All rights reserved.
//

#import "Director.h"
#import "BLEManager.h"
#import "Dascom_device.h"
#import "tw776_device.h"

@interface Director ()

@property(nonatomic, strong) BLEManager     *bleManager;
@property(nonatomic, strong) Dascom_device  *device;   //已经连接上的设备。在手机和设备连接完成之后，会初始化装配上device对象。

@end

@implementation Director
/*
 *  单例
 */
+ (Director *)shareDirector{
    static Director *defaultDirector = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        defaultDirector = [[self alloc] init];
        defaultDirector.bleManager = [BLEManager shareBLEManager];
    });
    return defaultDirector;
}

#pragma mark - 异常收集
- (void)exception
{
    tw776_device *tw776 = [[tw776_device alloc] init];
//    [tw776 setSanInfo:<#(NSDate *)#> and:<#(NSDate *)#>]
    [tw776 doSomethingElse];
}

#pragma mark - 蓝牙管理
/*
 *  开启蓝牙扫描
 */
- (void)makeCommunicationWithDevice
{
    [[BLEManager shareBLEManager] scan];
}

#pragma mark - 业务管理
/*
 *  配置朝三信息
 */
- (void)setSanInfo:(NSDate *)startTime and:(NSDate *)endTime
{
    
}
/*
 *  配置暮四信息
 */
- (void)setSiInfo:(NSDate *)startTime and:(NSDate *)endTime
{

}


@end
