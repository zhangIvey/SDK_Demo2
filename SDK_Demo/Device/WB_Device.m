//
//  WB_Device.m
//  SDK_Demo
//
//  Created by yaoln on 2017/8/31.
//  Copyright © 2017年 zhangze. All rights reserved.
//

#import "WB_Device.h"
#import "WB_DeviceType_Action.h"

@implementation WB_Device




- (void)getDeviceType:(void (^)(NSString *)) block
{
    WB_DeviceType_Action *action = [[WB_DeviceType_Action alloc] init];
    [[WB_BLEManager shareBLEManager] sendMessage:[action toOrderString] ToCharType:@"1527" withResultBlock:^(NSData *data){
        NSLog(@"拿到数据");
        NSLog(@"检验");
//        if (![self validationForResponse:data]){
        if ( /* DISABLES CODE */ (1) == 0){
            
            //异常了，要进行收集和反馈
            if (_delegate && [_delegate respondsToSelector:@selector(receiveException:)]) {
                WB_Exception *exception = [[WB_Exception alloc] init];
                exception.warnningString = @"抱歉，校验时发现错误";
                [_delegate receiveException:exception];
            }
            
        }else{
            NSString *string = [Wanbu_BlueToothUtility byteToString:data];
            NSLog(@"获取到的数据为：%@",string);
            block(string);
        }
        
    }];
}

- (BOOL)validationForResponse:(NSData *)data
{
    // ...校验代码
    return YES;
}




@end
