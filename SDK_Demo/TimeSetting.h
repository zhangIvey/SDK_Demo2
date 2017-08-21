//
//  TimeSetting.h
//  SDK_Demo
//
//  Created by yaoln on 2017/8/15.
//  Copyright © 2017年 zhangze. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 * 设置运动时间（比如：朝三暮四）
 */

typedef enum  {
    TIME_SETTING_SAN = 0,// 朝三
    TIME_SETTING_SI,// 暮四
} TimeType;

@interface TimeSetting : NSObject

@property(nonatomic, assign) TimeType   type;
@property(nonatomic, strong) NSDate     *startTime;
@property(nonatomic, strong) NSDate     *endTime;

@end
