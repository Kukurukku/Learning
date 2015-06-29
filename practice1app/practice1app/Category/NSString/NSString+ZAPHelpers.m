//
//  NSString+ZAPHelpers.m
//  movieCuration
//
//  Created by m_sugawara on 2015/03/31.
//  Copyright (c) 2015年 zappallas. All rights reserved.
//

#import "NSString+ZAPHelpers.h"

@implementation NSString (ZAPHelpers)

- (NSArray *)regexMatchStringsWithPattern:(NSString *)pattern {
    NSError *error = nil;
    NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:&error];
    if (error) {
        DLog(@"regex error:%@ - %@", error, error.userInfo);
        return nil;
    }
    
    NSMutableArray *matchStrings = [NSMutableArray array];
    NSArray *matches = [regex matchesInString:self options:0 range:NSMakeRange(0, self.length)];
    for (NSTextCheckingResult *match in matches) {
        for (int i = 0; i < [match numberOfRanges]; i++) {
            NSString *matchString = [self substringWithRange:[match rangeAtIndex:i]];
            [matchStrings addObject:matchString];
        }
    }
    
    return matchStrings;
}

- (NSString *)regexMatchStringWithPattern:(NSString *)pattern {
    NSString *matchString = @"";
    NSError *error = nil;
    NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:&error];
    if (error) {
        DLog(@"regex error:%@ - %@", error, error.userInfo);
        return nil;
    }

    NSArray *matches = [regex matchesInString:self options:0 range:NSMakeRange(0, self.length)];
    for (NSTextCheckingResult *match in matches) {
        // 一つもマッチしてない場合nilを返す(結果の１つ目は文字列全体なので、マッチしていれば２つ以上になる）
        if ([match numberOfRanges] <= 1) {
            return nil;
        }
        // パターンにマッチしたうちの1つ目を取得
        matchString = [self substringWithRange:[match rangeAtIndex:1]];
    }
    
    return matchString;
}

@end
