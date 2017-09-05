//
//  Wanbu_BlueToothUtility.m
//  WanbuIOS
//
//  Created by dascom on 15-5-7.
//  Copyright (c) 2015年 Sun Beibei. All rights reserved.
//

#import "Wanbu_BlueToothUtility.h"

@implementation Wanbu_BlueToothUtility

+ (NSData *)HexConvertToASCII:(NSString *)hexString {
    int j=0;
    Byte bytes[22];  ///3ds key的Byte 数组， 128位
    for(int i=0;i<[hexString length];i++)
    {
        int int_ch;  /// 两位16进制数转化后的10进制数
        
        unichar hex_char1 = [hexString characterAtIndex:i]; ////两位16进制数中的第一位(高位*16)
        
        int int_ch1;
        
        if(hex_char1 >= '0' && hex_char1 <='9')
            
            int_ch1 = (hex_char1-48)*16;   //// 0 的Ascll - 48
        
        else if(hex_char1 >= 'A' && hex_char1 <='F')
            
            int_ch1 = (hex_char1-55)*16; //// A 的Ascll - 65
        
        else
            
            int_ch1 = (hex_char1-87)*16; //// a 的Ascll - 97
        
        i++;
        
        unichar hex_char2 = [hexString characterAtIndex:i]; ///两位16进制数中的第二位(低位)
        
        int int_ch2;
        
        if(hex_char2 >= '0' && hex_char2 <='9')
            
            int_ch2 = (hex_char2-48); //// 0 的Ascll - 48
        
        else if(hex_char1 >= 'A' && hex_char1 <='F')
            
            int_ch2 = hex_char2-55; //// A 的Ascll - 65
        
        else
            
            int_ch2 = hex_char2-87; //// a 的Ascll - 97
        
        
        
        int_ch = int_ch1+int_ch2;
        
        NSLog(@"int_ch=%d",int_ch);
        
        bytes[j] = int_ch;  ///将转化后的数放入Byte数组里
        
        j++;
        
    }
    
    NSData *newData = [[NSData alloc] initWithBytes:bytes length:22];
    return newData;
}


#pragma mark - Str转NSData
+ (NSData*)stringToByte:(NSString*)string {
    NSString *hexString=[[string uppercaseString] stringByReplacingOccurrencesOfString:@" " withString:@""];
    if ([hexString length]%2!=0) {
        return nil;
    }
    Byte tempbyt[1]={0};
    NSMutableData* bytes=[NSMutableData data];
    for(int i=0;i<[hexString length];i++)
    {
        unichar hex_char1 = [hexString characterAtIndex:i]; ////两位16进制数中的第一位(高位*16)
        int int_ch1;
        if(hex_char1 >= '0' && hex_char1 <='9')
            int_ch1 = (hex_char1-48)*16;   //// 0 的Ascll - 48
        else if(hex_char1 >= 'A' && hex_char1 <='F')
            int_ch1 = (hex_char1-55)*16; //// A 的Ascll - 65
        else
            return nil;
        i++;
        
        unichar hex_char2 = [hexString characterAtIndex:i]; ///两位16进制数中的第二位(低位)
        int int_ch2;
        if(hex_char2 >= '0' && hex_char2 <='9')
            int_ch2 = (hex_char2-48); //// 0 的Ascll - 48
        else if(hex_char2 >= 'A' && hex_char2 <='F')
            int_ch2 = hex_char2-55; //// A 的Ascll - 65
        else
            return nil;
        
        tempbyt[0] = int_ch1+int_ch2;  ///将转化后的数放入Byte数组里
        [bytes appendBytes:tempbyt length:1];
    }
    return bytes;
}
#pragma mark - NSData转Str
+ (NSString*)byteToString:(NSData*)data {
    Byte *plainTextByte = (Byte *)[data bytes];
    NSString *hexStr=@"";
    for(int i=0;i<[data length];i++)
    {
        NSString *newHexStr = [NSString stringWithFormat:@"%x",plainTextByte[i]&0xff];///16进制数
        if([newHexStr length]==1)
            hexStr = [NSString stringWithFormat:@"%@0%@",hexStr,newHexStr];
        else
            hexStr = [NSString stringWithFormat:@"%@%@",hexStr,newHexStr];
    }
    return hexStr;
}


//  十进制转二进制
+ (NSString *)toBinarySystemWithDecimalSystem:(NSString *)decimal {
    int num = [decimal intValue];
    int remainder = 0;      //余数
    int divisor = 0;        //除数
    NSString * prepare = @"";
    while (true) {
        remainder = num%2;
        divisor = num/2;
        num = divisor;
        prepare = [prepare stringByAppendingFormat:@"%d",remainder];
        if (divisor == 0) {
            break;
        }
    }
    
    NSString * result = @"";
    for (NSInteger i = prepare.length - 1; i >= 0; i --) {
        result = [result stringByAppendingFormat:@"%@",[prepare substringWithRange:NSMakeRange(i , 1)]];
    }
    return result;
}
//  二进制转十进制
+ (NSString *)toDecimalSystemWithBinarySystem:(NSString *)binary {
    int ll = 0 ;
    int  temp = 0 ;
    for (int i = 0; i < binary.length; i ++) {
        temp = [[binary substringWithRange:NSMakeRange(i, 1)] intValue];
        temp = temp * powf(2, binary.length - i - 1);
        ll += temp;
    }
    NSString * result = [NSString stringWithFormat:@"%d",ll];
    return result;
}


#pragma mark - 转十六进制
+ (NSString *)toHex:(NSInteger)num {
    return [NSString stringWithFormat:@"%02lx",(long)num];
}
#pragma mark - 转十进制
+ (NSString *)toDec:(NSString *)hex {
    return [NSString stringWithFormat:@"%lu",strtoul(hex.UTF8String, 0, 16)];
}

+ (NSString *)getTimeNow {
    NSString* date = nil;
    NSDateFormatter * formatter = [[[NSDateFormatter alloc]init] autorelease];
    [formatter setDateFormat:@"yyyyMMddHHmmssSS"];
    date = [formatter stringFromDate:[NSDate date]];
    return date;
}

+ (NSString *)getCurrentDate {
    NSCalendar  * cal=[NSCalendar currentCalendar];
    NSUInteger  unitFlags=NSDayCalendarUnit|NSMonthCalendarUnit|NSYearCalendarUnit;
    NSDateComponents * conponent= [cal components:unitFlags fromDate:[NSDate date]];
    NSInteger year=[conponent year];
    NSInteger month=[conponent month];
    NSInteger day=[conponent day];
    NSString *  nsDateString= [NSString stringWithFormat:@"%4ld%2ld%2ld",year,month,day];
    return nsDateString;
}

+ (NSString *)getLastDay:(NSDate *)date {
    NSDate *lastDay = [NSDate dateWithTimeInterval:-24*60*60 sinceDate:date];
    NSDateFormatter *formatter = [[[NSDateFormatter alloc]init] autorelease];
    [formatter setDateFormat:@"yyyyMMddHHmmssSS"];
    return [formatter stringFromDate:lastDay];
}


+ (NSDate *)toDayDate:(NSString *)uiDate {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyyMMdd"];
    NSDate *date=[formatter dateFromString:[uiDate copy]];
    [formatter release];
    return date;
}

+ (NSString *)getDayLastDay:(NSDate *)date {
    NSDate *lastDay = [NSDate dateWithTimeInterval:-24*60*60 sinceDate:date];
    NSDateFormatter *formatter = [[[NSDateFormatter alloc]init] autorelease];
    [formatter setDateFormat:@"yyyyMMdd"];
    return [formatter stringFromDate:lastDay];
}

+ (NSString *)getDayTomorrow:(NSDate *)date {
    NSDate *lastDay = [NSDate dateWithTimeInterval:+24*60*60 sinceDate:date];
    NSDateFormatter *formatter = [[[NSDateFormatter alloc]init] autorelease];
    [formatter setDateFormat:@"yyyyMMdd"];
    return [formatter stringFromDate:lastDay];
}

+ (NSString *)getBeforeMonth:(NSString *)date {
    NSDate *lastDay = [NSDate dateWithTimeInterval:-24*60*60*31 sinceDate:[self toDayDate:date]];
    NSDateFormatter *formatter = [[[NSDateFormatter alloc]init] autorelease];
    [formatter setDateFormat:@"yyyyMMdd"];
    return [formatter stringFromDate:lastDay];
}

+ (NSString *)getAfterMonth:(NSString *)date {
    NSDate *lastDay = [NSDate dateWithTimeInterval:+24*60*60*31 sinceDate:[self toDayDate:date]];
    NSDateFormatter *formatter = [[[NSDateFormatter alloc]init] autorelease];
    [formatter setDateFormat:@"yyyyMMdd"];
    return [formatter stringFromDate:lastDay];
}

+ (NSString *)toDecOfThreePlace:(NSString *)hex {
    return [NSString stringWithFormat:@"%03lu",strtoul(hex.UTF8String, 0, 16)];
}

+ (NSString *)toDecOfTwoPlace:(NSString *)hex {
    return [NSString stringWithFormat:@"%02lu",strtoul(hex.UTF8String, 0, 16)];
}

+ (NSString *)toHexOfFourPlace:(NSInteger)num {
    return [NSString stringWithFormat:@"%04lx",(long)num];
}

+ (NSString *)toHexHighOrder:(NSInteger)num {
    NSString *hex = [Wanbu_BlueToothUtility toHexOfFourPlace:num];
    return [hex substringWithRange:NSMakeRange(0, 2)];
}

+ (NSString *)toHexLowOrder:(NSInteger)num {
    NSString *hex = [Wanbu_BlueToothUtility toHexOfFourPlace:num];
    return [hex substringWithRange:NSMakeRange(hex.length - 2, 2)];
}

+ (NSString *)toHexOfSixPlace:(NSInteger)num {
    return [NSString stringWithFormat:@"%06lx",(long)num];
}

+ (NSString *)toHexOfSixPlaceHighOrder:(NSInteger)num {
    NSString *hex = [Wanbu_BlueToothUtility toHexOfSixPlace:num];
    return [hex substringWithRange:NSMakeRange(0, 2)];
}

+ (NSString *)toHexOfSixPlaceCentreOrder:(NSInteger)num {
    NSString *hex = [Wanbu_BlueToothUtility toHexOfSixPlace:num];
    return [hex substringWithRange:NSMakeRange(2, 2)];
}

+ (NSString *)toHexOfSixPlaceLowOrder:(NSInteger)num {
    NSString *hex = [Wanbu_BlueToothUtility toHexOfSixPlace:num];
    return [hex substringWithRange:NSMakeRange(hex.length - 2, 2)];
}


+ (NSDate *)toDate:(NSString *)uiDate {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyMMddHHmmss"];
    NSDate *date=[formatter dateFromString:uiDate];
    [formatter release];
    return date;
}

+ (NSString *)stringFromDate:(NSDate *)date{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyMMddHHmmss"];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    [dateFormatter release];
    return destDateString;
}

//时间戳转为时间
+ (NSString *)toTime:(NSString *)time {
    NSDate * dt = [NSDate dateWithTimeIntervalSince1970:time.longLongValue];
    NSDateFormatter * df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyMMddHHmmss"];
    NSString *regStr = [df stringFromDate:dt];
    [df release];
    return regStr;
}

+ (NSString *)toTimesap:(NSDate *)date {
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[date timeIntervalSince1970]];
    return timeSp;
}

+ (NSInteger)apartFromDate:(NSString *)fromDateStr toDate:(NSString *)toDateStr {
    NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
    [dateFormatter setDateFormat:@"yyyyMMdd"];
    NSDate *fromDate = [dateFormatter dateFromString:fromDateStr];
    NSDate *toDate = [dateFormatter dateFromString:toDateStr];
    NSTimeInterval time = [fromDate timeIntervalSinceDate:toDate];
    NSInteger days= ((NSInteger)time)/(3600*24);
    return days;
}


@end
