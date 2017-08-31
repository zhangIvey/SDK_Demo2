//
//  WB_actionModel.h
//  SDK_Demo
//
//  Created by yaoln on 2017/8/31.
//  Copyright © 2017年 zhangze. All rights reserved.
//

#import <Foundation/Foundation.h>
/*!
 * @class WB_actionModel
 * 
 * @discussion 健康设备中通过发指令才能完成的任务，都要继承本类，如果有需要是需要重写方法 - (NSString *)toOrderString;
 */
@interface WB_actionModel : NSObject

/*!
 * @discussion 该方法是用来将该功能设置的参数进行转化，返回硬件设备可以执行的字符串指令
 */
- (NSString *)toOrderString;

@end
