//
//  WB_morning_evening_Model.h
//  SDK_Demo
//
//  Created by yaoln on 2017/8/31.
//  Copyright © 2017年 zhangze. All rights reserved.
//

#import <Foundation/Foundation.h>



/*!
 * @enum SettingType : 标示设置的是 “朝朝”还是 “暮暮”
 * 0      ：朝朝
 * 0 >> 1 ：暮暮
 */
typedef enum {
    TIME_SETTING_MORNNING = 0,
    TIME_SETTING_EVENNING = 0>>1
} SettingType;

/*!
 * @class WB_AMPM_Model
 *
 * @discussion 计步器设备 朝朝暮暮的数据模型
 */

@interface WB_AMPM_Model : NSObject

@property(nonatomic, assign)    SettingType     type;       //设置朝朝或者暮暮
@property(nonatomic, copy)      NSString       *startTime;  //开始时间
@property(nonatomic, copy)      NSString       *endTime;    //结束时间

/*!
 * @method initWithType:withStartTime:withEndTime;
 *
 * @discussion 计步器设备 根据朝朝暮暮的设置类型和起止时间初始化
 */
- (instancetype)initWithType:(SettingType) type withStartTime:(NSString *)startTime withEndTime:(NSString *)endTime;


@end
