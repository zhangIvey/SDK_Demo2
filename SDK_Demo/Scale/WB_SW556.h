//
//  WB_SW556.h
//  SDK_Demo
//
//  Created by yaoln on 2017/8/31.
//  Copyright © 2017年 zhangze. All rights reserved.
//

#import "WB_Scale.h"

/*!
 * @class WB_Scale
 * @discussion   万步网的体重秤 型号：SW556
 */
@interface WB_SW556 : WB_Scale


#pragma operation : WB_SW556特有的操作
/*!
 * @method doSW556Something
 * @discussion   型号：SW556体重秤的特有事务
 */
-(void)doSW556Something;

@end
