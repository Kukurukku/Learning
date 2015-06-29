//
//  NSString+ZAPURLEncoding.m
//  koiuranai
//
//  Created by 日野　慎哉 on 2015/01/05.
//  Copyright (c) 2015年 Zappallas. All rights reserved.
//

#import "NSString+ZAPURLEncoding.h"

@implementation NSString (ZAPURLEncoding)

- (NSString *)stringByAddingPercentEscaping {
    return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL, (__bridge CFStringRef)self, NULL, (CFStringRef)@"!\"#$%&’()*+,/:;<=>?@[]^`{|}~ \\", kCFStringEncodingUTF8));
}

@end
