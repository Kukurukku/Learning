//
//  NSString+ZAPValidation.m
//  koiuranai
//
//  Created by 日野　慎哉 on 2015/01/05.
//  Copyright (c) 2015年 Zappallas. All rights reserved.
//

#import "NSString+ZAPValidation.h"

@implementation NSString (ZAPValidation)

- (BOOL)isEmpty {
    if (self.length == 0 ||
        [self hasOnlyWhiteSpaces]) {
        return YES;
    }
    return NO;
}
- (BOOL)hasOnlyWhiteSpaces {
    NSString *stringWithoutWhiteSpaces = [self stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@" 　"]]; // 全角と半角のスペース
    if (stringWithoutWhiteSpaces.length == 0) {
        return YES;
    }
    return NO;
}


@end
