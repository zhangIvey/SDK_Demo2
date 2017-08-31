//
//  WB_Pedometer.h
//  SDK_Demo
//
//  Created by yaoln on 2017/8/31.
//  Copyright © 2017年 zhangze. All rights reserved.
//

#import "WB_Device.h"
#import "WB_morning_evening_Model.h"
/*!
 * @class WB_Pedometer 万步网的计步器设备
 *
 *
 */
@interface WB_Pedometer : WB_Device



#pragma method : 计步器的通用业务
- (BOOL)setMornings:(WB_morning_evening_Model *)mornningModel andEvenning:(WB_morning_evening_Model *)evenningModel;

@end
