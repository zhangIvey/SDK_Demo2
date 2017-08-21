//
//  SDK_tools.h
//  SDK_Demo
//
//  Created by yaoln on 2017/8/10.
//  Copyright © 2017年 zhangze. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 * 工具类 （字符转换，为空判断等）
 */
@interface SDK_tools : NSObject

+ (SDK_tools *)SDKToolsManager;

/**
 * 字节装换
 */
- (NSString *)byteTransform:(Byte) byte;


@end
