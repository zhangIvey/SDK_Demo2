//
//  TimeSetting.m
//  SDK_Demo
//
//  Created by yaoln on 2017/8/15.
//  Copyright © 2017年 zhangze. All rights reserved.
//

#import "TimeSetting.h"

@implementation TimeSetting

- (instancetype)initWithType:(TimeType) typeID and:(NSDate *)startTime and:(NSDate *)endTime
{
    self = [super init];
    if (self) {
        self.type = typeID;
        self.startTime = startTime;
        self.endTime = endTime;
    }
    return self;
}

@end
