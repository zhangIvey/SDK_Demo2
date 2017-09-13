//
//  WB_Pedometer.m
//  SDK_Demo
//
//  Created by yaoln on 2017/8/31.
//  Copyright © 2017年 zhangze. All rights reserved.
//

#import "WB_Pedometer.h"

@implementation WB_Pedometer


- (void)setAMPMTimeSetting:(WB_AMPM_Setting_Action *)ampmAction withBlock:(void (^)(BOOL isSuccess)) block
{
    [[WB_BLEManager shareBLEManager] sendMessage:[ampmAction toOrderString] ToCharType:@"1527" withResultBlock:^(NSData *resultData){
        NSLog(@"设置朝朝暮暮的回调方法");
        //处理接收到的数据
        //捕获异常
        //执行block
        block(YES); 
    }];
}

@end
