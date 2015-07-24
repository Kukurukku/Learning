//
//  InteractionTransitionAnimation.m
//  Cap7ScreenTransition
//
//  Created by 東屋 百合絵 on 2015/07/12.
//  Copyright (c) 2015年 TestProject. All rights reserved.
//

#import "SlideInteractionController.h"

@implementation SlideInteractionController
// ジェスチャ検出の対象となるビューをセット
// 同時にジェスチャリコグナイザを生成
- (void)setView:(UIView *)view
{
    _view = view;
    UIPanGestureRecognizer *gesture =
    [[UIPanGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handlePan:)];
    [self.view addGestureRecognizer:gesture];
}

// ジェスチャハンドラ
- (void)handlePan:(UIPanGestureRecognizer *)recognizer
{
    switch (recognizer.state) {
        case UIGestureRecognizerStateBegan:
        {
            // ジェスチャ開始を通知（デリゲートメソッド側で画面遷移を開始）
            self.interactive = YES;
            CGPoint point = [recognizer locationInView:self.view];
            [self.delegate interactionController:self interactionBeganAtPoint:point];
            break;
        }
        case UIGestureRecognizerStateChanged:
        {
            CGRect viewRect = self.view.bounds;
            CGPoint translation = [recognizer translationInView:self.view];
            CGFloat percent = translation.x / CGRectGetWidth(viewRect);
            // 画面遷移の進捗を更新
            [self updateInteractiveTransition:percent];
            break;
        }
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateEnded:
        {
            CGPoint velocity = [recognizer velocityInView:self.view];
            if (velocity.x <= 0) { // 右から左へ移動中
                // インタラクション動作キャンセル
                [self cancelInteractiveTransition];
            } else { // 左から右に移動中
                // インタラクション動作終了
                [self finishInteractiveTransition];
            }
            self.interactive = NO;
            break;
        }
        default:
            break;
    }
}
@end
