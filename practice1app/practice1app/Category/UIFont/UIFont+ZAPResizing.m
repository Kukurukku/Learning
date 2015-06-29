//
//  UIFont+ZAPResizing.m
//  koiuranai
//
//  Created by 日野　慎哉 on 2015/01/26.
//  Copyright (c) 2015年 Zappallas. All rights reserved.
//

#import "UIFont+ZAPResizing.h"

@implementation UIFont (ZAPResizing)

- (UIFont *)fontWithScale:(CGFloat)scale {
    return [self fontWithSize:self.pointSize * scale];
}

@end
