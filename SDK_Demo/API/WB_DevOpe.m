//
//  WB_DevOpe.m
//  SDK_Demo
//
//  Created by yaoln on 2017/8/31.
//  Copyright © 2017年 zhangze. All rights reserved.
//

#import "WB_DevOpe.h"
#import "WB_TW776.h"
#import "WB_SW556.h"

@interface WB_DevOpe ()

@property(nonatomic, assign) id currentDevice;

@end

@implementation WB_DevOpe

+ (WB_DevOpe *)shareOperation{
    static WB_DevOpe *defaultOperation = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        defaultOperation = [[self alloc] init];
    });
    return defaultOperation;
}

#pragma mark - 蓝牙功能

- (void)scanAndConnect
{
    
}

- (void)startScan
{
    
}
- (void)stopScan
{
    
}
- (BOOL)sendOrderString:(NSString *)orderString
{
    return YES;
}

#pragma mark - 连接上的外设读取信息后，进行拼装
- (WB_Device *)groutingDeviceWithTypeName:(NSString *)typeName
{
    
    if ([typeName isEqualToString:@"tw776"]) {
        _currentDevice = (WB_TW776 *)[[WB_TW776 alloc] init];
    }else if ([typeName isEqualToString:@"SW556"]){
        _currentDevice = (WB_TW776 *)[[WB_TW776 alloc] init];
    }
    return _currentDevice;
}

#pragma mark - 计步器业务
- (void)setAMPMTime:(WB_AMPM_Setting_Action *)ampmSettingAction withResult:(void(^)(BOOL isSuccess)) result;
{
    [_currentDevice setAMPMTimeSetting:ampmSettingAction];
}



@end
