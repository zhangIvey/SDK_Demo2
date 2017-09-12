//
//  WB_Pedometer.h
//  SDK_Demo
//
//  Created by yaoln on 2017/8/31.
//  Copyright © 2017年 zhangze. All rights reserved.
//

#import "WB_Device.h"
#import "WB_AMPM_Setting_Action.h"
/*!
 * @class WB_Pedometer
 * @discussion 万步网的计步器设备
 */
@interface WB_Pedometer : WB_Device



#pragma method : 计步器的通用业务
/*!
 * @method - setAMPMTimeSetting:
 * @discussion 设置计步器的朝朝暮暮
 */
- (void)setAMPMTimeSetting:(WB_AMPM_Setting_Action *)ampmAction;



@end
