//
//  NSString+ZAPArray.m
//  koiuranai
//
//  Created by 日野　慎哉 on 2015/01/05.
//  Copyright (c) 2015年 Zappallas. All rights reserved.
//

#import "NSString+ZAPArray.h"

@implementation NSString (ZAPArray)

+ (NSString *)stringFromArray:(NSArray *)array separateBy:(NSString *)separator {
    NSUInteger count = array.count;
    if (count <= 0) {
        return nil;
    }
    NSString *combinedString = @"";
    for (int i = 0; i < count; i++) {
        if (i > 0) {
            combinedString = [combinedString stringByAppendingString:separator];
        }
        id object = [array objectAtIndex:i];
        // 配列の中にひとでもNSString以外のオブジェクトが入っている場合はnilを返す
        if (![object isKindOfClass:[NSString class]]) {
            return nil;
        }
        NSString *string = [array objectAtIndex:i];
        combinedString = [combinedString stringByAppendingString:string];
    }
    return combinedString;
}

@end
