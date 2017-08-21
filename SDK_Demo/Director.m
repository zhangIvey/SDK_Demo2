//
//  Director.m
//  SDK_Demo
//
//  Created by yaoln on 2017/8/10.
//  Copyright © 2017年 zhangze. All rights reserved.
//

#import "Director.h"
#import "BLEManager.h"

@interface Director ()

@property(nonatomic, strong) BLEManager *bleManager;

@end

@implementation Director
/*
 *  单例
 */
+ (Director *)shareDirector{
    static Director *defaultDirector = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        defaultDirector = [[self alloc] init];
        defaultDirector.bleManager = [BLEManager shareBLEManager];
    });
    return defaultDirector;
}

#pragma mark - 蓝牙管理
/*
 *  开启蓝牙扫描
 */
- (void)startScan
{
    [[BLEManager shareBLEManager] scan];
}

#pragma mark - 业务管理
/*
 *  配置朝三信息
 */
- (void)setSanInfo:(NSString *)sanModel
{
    
}


@end
