//
//  ExceptionForSDK.m
//  SDK_Demo
//
//  Created by yaoln on 2017/8/18.
//  Copyright © 2017年 zhangze. All rights reserved.
//

#import "ExceptionForSDK.h"

@implementation ExceptionForSDK


- (instancetype)initWith:(int )typeID andWith:(NSString *)description
{
    self = [super init];
    if (self) {
        self.exceptionType = typeID;
        self.exceptionDes = description;
    }
    return self;
}

@end
