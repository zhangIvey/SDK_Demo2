//
//  Order_operaiton.h
//  SDK_Demo
//
//  Created by yaoln on 2017/8/10.
//  Copyright © 2017年 zhangze. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 * 指令拼接类
 */
@interface Order_operaiton : NSObject

//拼装朝三指令
-(NSString *)setAmTime:(int)start and:(int)end;

//拼装暮四指令
-(NSString *)setPmTime:(int)start and:(int)end;

//获取电量指令
-(NSString *)getPowerLever;

@end
