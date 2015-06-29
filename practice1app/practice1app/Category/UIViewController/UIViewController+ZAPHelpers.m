//
//  UIViewController+ZAPHelpers.m
//  koiuranai
//
//  Created by 日野　慎哉 on 2015/02/04.
//  Copyright (c) 2015年 Zappallas. All rights reserved.
//

#import "UIViewController+ZAPHelpers.h"

@implementation UIViewController (ZAPHelpers)

- (UIViewController *)findPresentedViewControllerRecursively {
    UIViewController *vc = nil;
    if (self.presentedViewController) {
        vc = [self.presentedViewController findPresentedViewControllerRecursively];
        if (!vc) {
            vc = self.presentedViewController;
        }
    }
    return vc;
}

@end
