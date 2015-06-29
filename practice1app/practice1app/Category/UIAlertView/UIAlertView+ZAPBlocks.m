//
//  UIAlertView+ZAPBlocks.m
//  SamplePurchase
//
//  Created by 日野　慎哉 on 2014/10/15.
//  Copyright (c) 2014年 Zappallas. All rights reserved.
//

#import "UIAlertView+ZAPBlocks.h"
#import <objc/runtime.h>

static NSString * kAlertViewCompletionBlockKey;

@interface UIAlertView()

@end

@implementation UIAlertView (ZAPBlocks)
@dynamic completionBlock;

#pragma mark Initializer
- (id)initWithTitle:(NSString *)title message:(NSString *)message completion:(AlertViewcompletion)completionBlock cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... {
    self = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
    if (self !=nil) {
        self.delegate = self;
        va_list arguments;
        va_start(arguments, otherButtonTitles);
        while(otherButtonTitles) {
            [self addButtonWithTitle:otherButtonTitles];
            //va_argを呼び出す度に、引数配列から一つずつ要素を取り出せる。
            otherButtonTitles = va_arg(arguments,id);
        }
        va_end(arguments);
        if (completionBlock != nil) {
            self.completionBlock = [completionBlock copy];
        }
    }
    return self;
}
#pragma mark -

#pragma mark Accessor Methods
- (void)setCompletionBlock:(AlertViewcompletion)completionBlock {
    objc_setAssociatedObject(self,
                             (__bridge const void *)(kAlertViewCompletionBlockKey),
                             completionBlock,
                             OBJC_ASSOCIATION_COPY_NONATOMIC
                             );
}
- (AlertViewcompletion)completionBlock {
    return objc_getAssociatedObject(self,
                                    (__bridge const void *)(kAlertViewCompletionBlockKey)
                                    );
}
#pragma mark -

#pragma mark UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (self.completionBlock != nil) {
        self.completionBlock(alertView, buttonIndex);
    }
    self.completionBlock = nil;
}
#pragma mark -

@end