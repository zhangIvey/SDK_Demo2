//
//  SDK_tools.m
//  SDK_Demo
//
//  Created by yaoln on 2017/8/10.
//  Copyright © 2017年 zhangze. All rights reserved.
//

#import "SDK_tools.h"

@implementation SDK_tools

+ (SDK_tools *)SDKToolsManager{
    static SDK_tools *defaultToolsManager = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        defaultToolsManager = [[self alloc] init];
        
    });
    return defaultToolsManager;
}

- (NSString *)byteTransform:(Byte) byte
{
    return @"转换后的字符串";
}

@end
