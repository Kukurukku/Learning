//
//  UIView+ZAPHelpers.m
//  koiuranai
//
//  Created by 日野　慎哉 on 2015/01/05.
//  Copyright (c) 2015年 Zappallas. All rights reserved.
//

#import "UIView+ZAPHelpers.h"

@implementation UIView (ZAPHelpers)

- (UIResponder *)findFirstResponder {
    // 自身がFirstResponderの場合は自身を返す
    if (self.isFirstResponder) {
        return self;
    }
    // subviewからFirstResponderを再帰的に走査する
    for (UIView *subview in self.subviews) {
        if ([subview isFirstResponder]) {
            return subview;
        } else {
            UIResponder *responder = [subview findFirstResponder];
            if (responder) {
                return responder;
            }
        }
    }
    return nil;
}
- (void)setExclusiveTouch:(BOOL)exclusiveTouch recursive:(BOOL)recursive {
    self.exclusiveTouch = exclusiveTouch;
    for (UIView *subview in self.subviews) {
        [subview setExclusiveTouch:exclusiveTouch recursive:recursive];
    }
}
@end
