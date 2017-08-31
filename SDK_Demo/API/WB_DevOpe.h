//
//  WB_DevOpe.h
//  SDK_Demo
//
//  Created by yaoln on 2017/8/31.
//  Copyright © 2017年 zhangze. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WB_Device.h"

/*!
 * @class WB_DevOpe 对使用者来说，直接进行调用的入口
 *
 * @discussion 对外提供API,对内进行各层的调度
 * 
 */
@interface WB_DevOpe : NSObject


#pragma method - 蓝牙API
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
ADSF 
/*!
 * @method  -sendOrderString
 *
 * @discussion : 发送指令
 *
 */
- (BOOL)sendOrderString:(NSString *)orderString;

#pragma method - 业务API
/*!
 * @method  -groutingDevice
 *
 * @discussion : 建立成功连接之后，识别出设备是什么类型，什么型号的版本
 *
 */
- (WB_Device *)groutingDevice;

@end
