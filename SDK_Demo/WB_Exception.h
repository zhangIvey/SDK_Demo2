//
//  WB_Exception.h
//  SDK_Demo
//
//  Created by yaoln on 2017/9/12.
//  Copyright © 2017年 zhangze. All rights reserved.
//

#import <Foundation/Foundation.h>
/*!
 * @class WB_Exception
 *
 * @discussion 异常类，用来汇报异常信息
 *
 */


@interface WB_Exception : NSObject

@property(nonatomic, copy)  NSString *warnningString; //提醒信息
@property(nonatomic, copy)  NSString *actionName;
@property(nonatomic, copy)  NSString *method;
@property(nonatomic, assign) BOOL isON;

/*!
 * @method writeLogs: andMethod:andNotes:
 *
 * @discussion 将要写的信息记录到文件中。
 *
 */
- (void)writeLogs:(NSString *)className andMethod:(NSString *)methodName andNotes:(NSString *)notes;

@end
