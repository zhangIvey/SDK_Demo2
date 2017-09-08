//
//  NSObject+WB_Device.h
//  SDK_Demo
//
//  Created by yaoln on 2017/9/8.
//  Copyright © 2017年 zhangze. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WB_Device.h"

@interface NSObject (WB_Device)
+ (NSString *)getDeviceType:(void (^)(WB_Device *))block;
@end
