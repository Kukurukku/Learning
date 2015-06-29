//
//  UIColor+ZAPHex.m
//  koiuranai
//
//  Created by 日野　慎哉 on 2015/01/05.
//  Copyright (c) 2015年 Zappallas. All rights reserved.
//

#import "UIColor+ZAPHex.h"

@implementation UIColor (ZAPHex)

+ (UIColor*)colorWithHex:(uint32_t)hex {
    CGFloat red = ((hex & 0xff000000) >> 24) / 255.0f;
    CGFloat green = ((hex & 0x00ff0000) >> 16) / 255.0f;
    CGFloat blue = ((hex & 0x0000ff00) >> 8) / 255.0f;
    CGFloat alpha = (hex & 0x000000ff) / 255.0f;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

@end
