//
//  InteractionTransitionAnimation.h
//  Cap7ScreenTransition
//
//  Created by 東屋 百合絵 on 2015/07/12.
//  Copyright (c) 2015年 TestProject. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol InteractionTransitionControllerDelegate;
@interface InteractionTransitionAnimation : UIPercentDrivenInteractiveTransition

@property (nonatomic,weak)id<InteractionTransitionControllerDelegate> delegate;
@property(nonatomic)UIView *view;
@property (nonatomic,getter=isInteractive)BOOL interactive;



@end

@protocol InteractionTransitionControllerDelegate <NSObject>
- (void)interactionController:(id <UIViewControllerInteractiveTransitioning>)controller
      interactionBeganAtPoint:(CGPoint)point;
@end