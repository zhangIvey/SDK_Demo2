//
//  WB_morning_evening_Model.h
//  SDK_Demo
//
//  Created by yaoln on 2017/8/31.
//  Copyright © 2017年 zhangze. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WB_actionModel.h"


/*!
 * @class WB_morning_evening_Model
 *
 * 计步器设备 朝朝暮暮的数据模型
 */


/*!
 * @enum SettingType : 标示设置的是 “朝朝”还是 “暮暮”
 * 0      ：朝朝
 * 0 >> 1 ：暮暮
 */
typedef enum {
    TIME_SETTING_MORNNING = 0,
    TIME_SETTING_EVENNING = 0>>1
} SettingType;

@interface WB_morning_evening_Model : WB_actionModel

@property(nonatomic, assign)   SettingType  type;       //设置朝朝或者暮暮
@property(nonatomic, strong)   NSDate       *startTime; //开始时间
@property(nonatomic, strong)   NSDate       *endTime;   //结束时间




@end
