//
//  WB_Pedometer.m
//  SDK_Demo
//
//  Created by yaoln on 2017/8/31.
//  Copyright © 2017年 zhangze. All rights reserved.
//

#import "WB_Pedometer.h"
#import "WB_DeviceType_Action.h"

@implementation WB_Pedometer


- (void)setAMPMTimeSetting:(WB_AMPM_Setting_Action *)ampmAction withBlock:(void (^)(BOOL isSuccess)) block
{
    __block WB_Pedometer *self_block = self;
    [[WB_BLEManager shareBLEManager] sendMessage:[ampmAction toOrderString] ToCharType:@"1527" withResultBlock:^(NSData *resultData){
        //...拿到数据
        //...设置朝朝暮暮的回调方法
        //...检验
        if (![super validationForResponse:resultData]){
            //异常了，要进行收集和反馈
            if (self_block.delegate && [self_block.delegate respondsToSelector:@selector(receiveException:)]) {
                self.exception.warnningString = [NSString stringWithFormat:@"%@抱歉，校验时发现错误",self.class];
                NSLog(@"exception.warnningString = %@",self_block.exception.warnningString);
                [self_block.delegate receiveException:self_block.exception];
            }
            block(NO);
        }else{
            NSString *string = [Wanbu_BlueToothUtility byteToString:resultData];
            NSLog(@"获取到的数据为：%@",string);
            block(YES);
        }
    }];
    
//    WB_DeviceType_Action *action = [[WB_DeviceType_Action alloc] init];
//    __block WB_Pedometer *self_block = self;
//    [[WB_BLEManager shareBLEManager] sendMessage:[action toOrderString] ToCharType:@"1527" withResultBlock:^(NSData *data){
//        NSLog(@"拿到数据");
//        NSLog(@"检验");
//        if (![super validationForResponse:data]){
//            //异常了，要进行收集和反馈
//            if (self_block.delegate && [self_block.delegate respondsToSelector:@selector(receiveException:)]) {
//                self.exception.warnningString = [NSString stringWithFormat:@"%@抱歉，校验时发现错误",self.class];
//                NSLog(@"exception.warnningString = %@",self_block.exception.warnningString);
//                [self_block.delegate receiveException:self_block.exception];
//            }
//            
//        }else{
//            NSString *string = [Wanbu_BlueToothUtility byteToString:data];
//            NSLog(@"获取到的数据为：%@",string);
//            block(string);
//        }
//        
//    }];
}

@end
