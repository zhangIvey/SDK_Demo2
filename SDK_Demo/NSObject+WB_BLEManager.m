//
//  NSObject+WB_BLEManager.m
//  SDK_Demo
//
//  Created by yaoln on 2017/9/8.
//  Copyright © 2017年 zhangze. All rights reserved.
//

#import "NSObject+WB_BLEManager.h"

@implementation NSObject (WB_BLEManager)

+(NSData *)sendMessageWithblock:(void (^)(WB_BLEManager *manager))block
{
    WB_BLEManager *manager = [WB_BLEManager shareBLEManager];
    block(manager);
    return manager.currentResultData;
}

//+(WB_BLEManager * (^)(NSString *))sendMessage;

@end
