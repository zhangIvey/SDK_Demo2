//
//  WB_TW776.h
//  SDK_Demo
//
//  Created by yaoln on 2017/8/31.
//  Copyright © 2017年 zhangze. All rights reserved.
//

#import "WB_Pedometer.h"
#import "WB_TW776_SomethingModel.h"

/*!
 * @class WB_TW776
 *
 * @discussion 万步网计步器 型号：TW776
 */
@interface WB_TW776 : WB_Pedometer


#pragma operation : TW776特有的操作
/*!
 * @method doTW776Something
 * @discussion   型号：TW776计步器的特有事务
 */
- (NSData *)doTW776Something:(WB_TW776_SomethingModel *)somethingModel;

@end
