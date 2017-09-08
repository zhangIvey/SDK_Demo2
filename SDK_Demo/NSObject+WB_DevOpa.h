//
//  NSObject+WB_DevOpa.h
//  SDK_Demo
//
//  Created by yaoln on 2017/9/8.
//  Copyright © 2017年 zhangze. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WB_DevOpe.h"


@interface NSObject (WB_DevOpa)
+(NSString *)getType:(void (^) (WB_DevOpe *)) block;

@end
