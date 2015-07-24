//
//  CustomPresentationController.m
//  DevelopmentSandbox
//
//  Created by 東屋　百合絵 on 2015/07/13.
//  Copyright (c) 2015年 東屋　百合絵. All rights reserved.
//

#import "CustomPresentationController.h"

@interface CustomPresentationController()
@property (nonatomic, readonly) UIView *dismmingView;

@end
@implementation CustomPresentationController

-(UIView *)dismmingView {
    static UIView *instance = nil;
    if(instance == nil) {
        instance = [[UIView alloc]initWithFrame:self.containerView.bounds];
        instance.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
    }
    return instance;
}

-(void)presentationTransitionWillBegin {

    UIView *presentedView = self.presentedViewController.view;
    presentedView.layer

}


@end
