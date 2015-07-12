//
//  CustomTransitionAnimation.m
//  Cap7ScreenTransition
//
//  Created by 東屋 百合絵 on 2015/07/12.
//  Copyright (c) 2015年 TestProject. All rights reserved.
//

#import "CustomTransitionAnimation.h"

@implementation CustomTransitionAnimation
-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{

    // 画面遷移コンテキストから遷移元、遷移先のビューコントローラを取得
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC =[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // 遷移元、遷移先ビュー
    UIView *fromView = fromVC.view;
    UIView * toView = toVC.view;
    
    // 画面遷移コンテキストからコンテナビューを取得
    UIView *containerView = [transitionContext containerView];
    
    // 画面内frameと画面外(右横）frameの計算（アニメーション用）
    CGRect inframe = [transitionContext initialFrameForViewController:fromVC];
    CGRect outframe = CGRectOffset(inframe, CGRectGetWidth(inframe), 0);
    
    if(self.presenting) {// 画面表示時
        // コンテナビュー上に遷移先ビューをついか
        [containerView addSubview:toView];
        
        // 各ビューをいアニメーション前の状態に設定
        // (遷移先ビューのframeを画面外に）
        toView.frame = outframe;
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            // アニメーションの実行
            toView.frame = inframe;
            
        }completion:^(BOOL finishied){
        
            // 画面遷移コンテキストに画面遷移の終了を通知
            BOOL completed = ![transitionContext transitionWasCancelled];
            [transitionContext completeTransition:completed];
        }];
        
    } else { // 画面消去時
        // コンテナビュー上に遷移先ビューをついか
        [containerView insertSubview:toView belowSubview:fromView];
        
        // 各ビューをアニメーションの前の状態に設定
        toView.frame = inframe;
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            fromView.frame = outframe;
        } completion:^(BOOL finished){
            BOOL completed = ![transitionContext transitionWasCancelled];
            [transitionContext completeTransition:completed];
        }];
    
    }
    
}

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{

    return 1.0; //画面遷移時間を1秒とする
}
@end
