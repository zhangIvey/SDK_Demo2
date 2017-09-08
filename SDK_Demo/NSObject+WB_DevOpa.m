//
//  NSObject+WB_DevOpa.m
//  SDK_Demo
//
//  Created by yaoln on 2017/9/8.
//  Copyright © 2017年 zhangze. All rights reserved.
//

#import "NSObject+WB_DevOpa.h"

@implementation NSObject (WB_DevOpa)
+(NSString *)getType:(void (^) (WB_DevOpe *)) block
{
    WB_DevOpe *dev = [[WB_DevOpe alloc] init];
    block(dev);
    return dev.typeString;
}

@end
