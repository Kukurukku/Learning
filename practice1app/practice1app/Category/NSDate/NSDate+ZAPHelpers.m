//
//  NSDate+ZAPHelpers.m
//  koiuranai
//
//  Created by 日野　慎哉 on 2015/01/05.
//  Copyright (c) 2015年 Zappallas. All rights reserved.
//

#import "NSDate+ZAPHelpers.h"

@implementation NSDate (ZAPHelpers)

+ (NSDate *)dateWithYear:(NSInteger)year Month:(NSInteger)month Day:(NSInteger)day {
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setYear:year];
    [comps setMonth:month];
    [comps setDay:day];
    [comps setHour:0];
    [comps setMinute:0];
    [comps setSecond:0];
    NSDate *defaultDate = [[NSCalendar currentCalendar] dateFromComponents:comps];
    return defaultDate;
}
- (NSDate*)dateByClearingTime {
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:self];
    [components setTimeZone:[NSTimeZone defaultTimeZone]];
    NSDate *clearedDate = [[NSCalendar currentCalendar] dateFromComponents:components];
    
    return clearedDate;
}

@end
