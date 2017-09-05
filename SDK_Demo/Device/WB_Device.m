//
//  WB_Device.m
//  SDK_Demo
//
//  Created by yaoln on 2017/8/31.
//  Copyright © 2017年 zhangze. All rights reserved.
//

#import "WB_Device.h"
#import "WB_DeviceType_Action.h"

@implementation WB_Device

- (NSString *)getDeviceType
{
    WB_DeviceType_Action *action = [[WB_DeviceType_Action alloc] init];
    [[WB_BLEManager shareBLEManager] sendMessage:[action toOrderString] ToCharType:@"1527" withResultBlock:^(NSData *data){
        NSLog(@"检验");
        NSLog(@"拿到数据");
    }];
    return @"tw776";
}


@end
