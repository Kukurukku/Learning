//
//  UIView+Rect.m
//  koiuranai
//
//  Created by 日野　慎哉 on 2015/01/05.
//  Copyright (c) 2015年 Zappallas. All rights reserved.
//

#import "UIView+ZAPRect.h"

@implementation UIView (ZAPRect)

- (CGFloat)bottom {
    return self.frame.size.height + self.frame.origin.y;
}
- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}
- (CGFloat)trailing {
    return self.frame.size.width + self.frame.origin.x;
}
- (void)setTrailing:(CGFloat)trailing {
    CGRect frame = self.frame;
    frame.origin.x = trailing - frame.size.width;
    self.frame = frame;
}
- (CGFloat)x {
    return self.frame.origin.x;
}
- (void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
- (CGFloat)y {
    return self.frame.origin.y;
}
- (void)setY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
- (CGFloat)width {
    return self.frame.size.width;
}
- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
- (CGFloat)height {
    return self.frame.size.height;
}
- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
- (CGFloat)centerX {
    return self.center.x;
}
- (void)setCenterX:(CGFloat)centerX {
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}
- (CGFloat)centerY {
    return self.center.y;
}
- (void)setCenterY:(CGFloat)centerY {
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}
- (CGPoint)origin {
    return self.frame.origin;
}
- (void)setOrigin:(CGPoint)origin {
    CGRect rect = self.frame;
    rect.origin = origin;
    self.frame = rect;
}
- (CGSize)size {
    return self.frame.size;
}
- (void)setSize:(CGSize)size {
    CGRect rect = self.frame;
    rect.size = size;
    self.frame = rect;
}
- (void)alignTop:(CGFloat)top bottom:(CGFloat)bottom {
    if (top > bottom) {
        return;
    }
    CGRect frame = self.frame;
    frame.origin.y = top;
    frame.size.height = bottom - frame.origin.y;
    self.frame = frame;
}

@end
