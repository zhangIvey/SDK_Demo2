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

<<<<<<< HEAD
<<<<<<< HEAD
- (void)getDeviceTypeWithBlock:(Result) rblock
=======
- (NSString *)getDeviceType
>>>>>>> parent of 76ddf95... demo
=======
- (void)getDeviceType
>>>>>>> parent of 6f3b657... demo
{
    WB_DeviceType_Action *action = [[WB_DeviceType_Action alloc] init];
    [[WB_BLEManager shareBLEManager] sendMessage:[action toOrderString] ToCharType:@"1527" withResultBlock:^(NSData *data){
        NSLog(@"检验");
        NSLog(@"拿到数据");
        NSString *string = [Wanbu_BlueToothUtility byteToString:data];
<<<<<<< HEAD
        NSLog(@"获取到的数据为：%@",string);
    }];

<<<<<<< HEAD
- (WB_Device * (^) (int))getDeviceType
{
    return ^(int number){
        WB_DeviceType_Action *action = [[WB_DeviceType_Action alloc] init];
        NSString *orderString = [action toOrderString];
        NSData *typeData = [NSObject sendMessageWithblock:^(WB_BLEManager *bleManager){
            bleManager.sendMessage(orderString, @"1527");
        }];
        NSString *string = [Wanbu_BlueToothUtility byteToString:typeData];
        NSLog(@"获取到的数据为：%@",string);
        self.modelID = string;
        return self;
    };
//        [[WB_BLEManager shareBLEManager] sendMessage:[action toOrderString] ToCharType:@"1527" withResultBlock:^(NSData *data){
//            NSLog(@"检验");
//            NSLog(@"拿到数据");
//            NSString *string = [Wanbu_BlueToothUtility byteToString:data];
//            NSLog(@"获取到的数据为：%@",string);
//        }];
    
=======
        NSLog(@"获取到的数据string = %@", string);
    }];
    return @"tw776";
>>>>>>> parent of 76ddf95... demo
=======
>>>>>>> parent of 6f3b657... demo
}


@end
