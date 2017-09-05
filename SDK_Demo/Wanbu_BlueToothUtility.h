//
//  Wanbu_BlueToothUtility.h
//  WanbuIOS
//
//  Created by dascom on 15-5-7.
//  Copyright (c) 2015年 Sun Beibei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Wanbu_BlueToothUtility : NSObject

+ (NSData *)HexConvertToASCII:(NSString *)hexString;

//NSString转NSData
+ (NSData*)stringToByte:(NSString*)string;

//NSData转NSString
+ (NSString*)byteToString:(NSData*)data;

//十进制转二进制
+ (NSString *)toBinarySystemWithDecimalSystem:(NSString *)decimal;

//二进制转十进制
+ (NSString *)toDecimalSystemWithBinarySystem:(NSString *)binary;

//十进制转十六进制（2位）
+ (NSString *)toHex:(NSInteger)num;

//十进制转十六进制（4位）
+ (NSString *)toHexOfFourPlace:(NSInteger)num;

//十进制转十六进制（高2位）
+ (NSString *)toHexHighOrder:(NSInteger)num ;

//十进制转十六进制（低2位）
+ (NSString *)toHexLowOrder:(NSInteger)num;

//十进制转十六进制（6位）
+ (NSString *)toHexOfSixPlace:(NSInteger)num;

//十进制转十六进制（6位高2位）
+ (NSString *)toHexOfSixPlaceHighOrder:(NSInteger)num;

//十进制转十六进制（6位中2位）
+ (NSString *)toHexOfSixPlaceCentreOrder:(NSInteger)num;

//十进制转十六进制（6位低2位）
+ (NSString *)toHexOfSixPlaceLowOrder:(NSInteger)num;

//十六进制转十进制
+ (NSString *)toDec:(NSString *)hex;

//十六进制转十进制（3位）
+ (NSString *)toDecOfThreePlace:(NSString *)hex;

//十六进制转十进制（2位）
+ (NSString *)toDecOfTwoPlace:(NSString *)hex;

//当前时间（YYYYMMddHHmmssSS）
+ (NSString *)getTimeNow;

+ (NSString *)getCurrentDate;

//昨天（YYYYMMddHHmmssSS）
+ (NSString *)getLastDay:(NSDate *)date;

//昨天（yyyyMMdd）
+ (NSString *)getDayLastDay:(NSDate *)date;

//明天（yyyyMMdd）
+ (NSString *)getDayTomorrow:(NSDate *)date;

//上月
+ (NSString *)getBeforeMonth:(NSString *)date;

//下月
+ (NSString *)getAfterMonth:(NSString *)date;


//NSSting转NSDate（yyMMddHHmmss）
+ (NSDate *)toDate:(NSString *)uiDate;

//NSSting转NSDate（yyyyMMdd）
+ (NSDate *)toDayDate:(NSString *)uiDate;

//NSDate转NSString（yyMMddHHmmss）
+ (NSString *)stringFromDate:(NSDate *)date;

//时间戳转时间（yyMMddHHmmss）
+ (NSString *)toTime:(NSString *)time;

//NSDate转时间戳
+ (NSString *)toTimesap:(NSDate *)date;

//两个日期间隔
+ (NSInteger)apartFromDate:(NSString *)fromDateStr toDate:(NSString *)toDateStr;

@end
