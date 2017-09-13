//
//  WB_Device.m
//  SDK_Demo
//
//  Created by yaoln on 2017/8/31.
//  Copyright © 2017年 zhangze. All rights reserved.
//

#import "WB_Device.h"
#import "WB_DeviceType_Action.h"

@interface WB_Device ()

@property(nonatomic, strong)    WB_Exception            *exception; //异常

@end

@implementation WB_Device


- (instancetype)init
{
    self = [super init];
    if (self) {
        _exception = [[WB_Exception alloc] init];
    }
    return self;
}


- (void)getDeviceType:(void (^)(NSString *)) block
{
    WB_DeviceType_Action *action = [[WB_DeviceType_Action alloc] init];
    [[WB_BLEManager shareBLEManager] sendMessage:[action toOrderString] ToCharType:@"1527" withResultBlock:^(NSData *data){
        NSLog(@"拿到数据");
        NSLog(@"检验");
        if (![self validationForResponse:data]){
            //异常了，要进行收集和反馈
            if (_delegate && [_delegate respondsToSelector:@selector(receiveException:)]) {
                _exception.warnningString = [NSString stringWithFormat:@"%@抱歉，校验时发现错误",self.class];
                NSLog(@"exception.warnningString = %@",_exception.warnningString);
                [_delegate receiveException:_exception];
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
