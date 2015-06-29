//
//  UIView+ZAPAnimation.h
//  koiuranai
//
//  Created by m_sugawara on 2015/02/05.
//  Copyright (c) 2015年 Zappallas. All rights reserved.
//

// Framework
@import UIKit;

/*!
 @category ZAPAnimation
 @abstract アニメーションに関する追加処理をまとめたカテゴリ
 */
@interface UIView (ZAPAnimation)

/*!
 @method startChangeScaleAnimationWithChangeRate:
 @abstract 縦と横に大きくなったり小さくなったりするアニメーションを開始します
 @param changeRate 動きの大きさ
 @param duration １回の動く時間
 @param repeat YES:繰り返す NO:１回のみ
 */
- (void)startChangeScaleAnimationWithChangeRate:(double)changeRate duration:(CFTimeInterval)duration repeat:(BOOL)repeat;


/*!
 @method stopAllAnimation
 @abstract すべてのアニメーションを終了してデフォルトの状態に戻す
 */
- (void)stopAllAnimation;

@end
