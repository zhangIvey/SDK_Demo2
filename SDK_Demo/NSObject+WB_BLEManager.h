//
//  NSObject+WB_BLEManager.h
//  SDK_Demo
//
//  Created by yaoln on 2017/9/8.
//  Copyright © 2017年 zhangze. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WB_BLEManager.h"
@interface NSObject (WB_BLEManager)

+(NSData *)sendMessageWithblock:(void (^)(WB_BLEManager *manager))block;

@end
