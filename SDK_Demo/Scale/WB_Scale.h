//
//  WB_Scale.h
//  SDK_Demo
//
//  Created by yaoln on 2017/8/31.
//  Copyright © 2017年 zhangze. All rights reserved.
//

#import "WB_Device.h"
/*!
 * @class WB_Scale 万步网的体重秤设备
 * @discussion 体重秤类型健康设备
 */
@interface WB_Scale : WB_Device

#pragma method : 体重秤的通用业务
/*!
 * @method - getWeightListWithNSDate
 * @discussion 根据时间获取某一天的体重测量数据
 */
- (id)getWeightListWithNSDate:(NSDate *)goalDate;

@end
