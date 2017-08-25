//
//  ResultForBLE.h
//  SDK_Demo
//
//  Created by yaoln on 2017/8/22.
//  Copyright © 2017年 zhangze. All rights reserved.
//

#import "Dascom_device.h"
#import "ExceptionForSDK.h"

@interface ResultForBLE : NSObject
@property(nonatomic, assign) BOOL isSuccess;
@property(nonatomic, strong) ExceptionForSDK *exception;

@end
