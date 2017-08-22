//
//  ExceptionForSDK.h
//  SDK_Demo
//
//  Created by yaoln on 2017/8/18.
//  Copyright © 2017年 zhangze. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    SHOW_ALERT_TYPE = 0, //需要显示给用户看的业务异常类型
    FILE_LOG_TYPE = 1 //需要记录的日志类型
} exeption_type;

@interface ExceptionForSDK : NSObject
@property(nonatomic, assign) int exceptionType; //异常类型
@property(nonatomic, copy) NSString *exceptionDes; //异常的描述

@end
