//
//  CustomTransitionAnimation.h
//  Cap7ScreenTransition
//
//  Created by 東屋 百合絵 on 2015/07/12.
//  Copyright (c) 2015年 TestProject. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SlideAnimationController : NSObject<UIViewControllerAnimatedTransitioning>
@property (nonatomic) BOOL presenting;

@end
