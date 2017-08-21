//
//  Director.h
//  SDK_Demo
//
//  Created by yaoln on 2017/8/10.
//  Copyright © 2017年 zhangze. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dascom_device.h"


/*
 * 调度者类
 */
@interface Director : NSObject

@property(nonatomic, strong) Dascom_device *currentDevice;

/*
 *  调度者单例
 */
+ (Director *)shareDirector;

#pragma mark - 异常收集
- (void)exception;

#pragma mark - 蓝牙管理
/*
 *  开启蓝牙扫描
 */
- (void)startScan;

#pragma mark - 业务管理
/*
 *  配置朝三信息
 */
- (void)setSanInfo:(NSString *)sanModel;

@end
