//
//  WB_TW776.m
//  SDK_Demo
//
//  Created by yaoln on 2017/8/31.
//  Copyright © 2017年 zhangze. All rights reserved.
//

#import "WB_TW776.h"

@implementation WB_TW776

- (NSData *)doTW776Something:(WB_TW776_SomethingModel *)somethingModel
{
    
    NSData *resultData = [[NSData alloc] initWithBase64EncodedString:@"返回的指令信息" options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return resultData;
}

@end
