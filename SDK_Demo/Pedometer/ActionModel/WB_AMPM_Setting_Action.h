//
//  WB_AMPM_Setting_Action.h
//  SDK_Demo
//
//  Created by yaoln on 2017/9/1.
//  Copyright © 2017年 zhangze. All rights reserved.
//

#import "WB_actionModel.h"
#import "WB_AMPM_Model.h"
/*!
 * @class WB_AMPM_Setting_Action
 *
 * @discussion 计步器设备 朝朝暮暮的设置功能
 */
@interface WB_AMPM_Setting_Action : WB_actionModel
@property(nonatomic, strong) WB_AMPM_Model *amModel;
@property(nonatomic, strong) WB_AMPM_Model *pmModel;

/*!
 * @method 初始化方法
 *
 */
- (instancetype)initWithAM:(WB_AMPM_Model *)amModel withPM:(WB_AMPM_Model *)pmModel;

@end
