//
//  UIView+ZAPAnimation.m
//  koiuranai
//
//  Created by m_sugawara on 2015/02/05.
//  Copyright (c) 2015年 Zappallas. All rights reserved.
//

#import "UIView+ZAPAnimation.h"

@implementation UIView (ZAPAnimation)

- (void)startChangeScaleAnimationWithChangeRate:(double)changeRate duration:(CFTimeInterval)duration repeat:(BOOL)repeat {

    // fps（適当、要調整）
    NSUInteger fps = 24;
    // 実際のフレーム数
    NSUInteger frameCount = duration * fps;
    // keytimes
    NSMutableArray *keytimes = [NSMutableArray arrayWithCapacity:frameCount];
    // values
    NSMutableArray *values = [NSMutableArray arrayWithCapacity:frameCount];
    // sin関数、cos関数の結果を全部入れる配列
    NSMutableArray *baseSinValues = [NSMutableArray arrayWithCapacity:frameCount];
    NSMutableArray *baseCosValues = [NSMutableArray arrayWithCapacity:frameCount];
    // 総フレーム数に対してkeytimeの値を割り振る
    for (double i = 0.0f, add = (double)1/frameCount; i <= 1.0f; i += add) {
        [keytimes addObject:@(i)];
        // 同時に各タイミングのsin値を取得
        // 円周上の右上〜左上へ移動（ex.45→135)
        double sinPIVariation = (M_PI_2 * changeRate);
        double sinPIInit = M_PI_2 - sinPIVariation;
        double sinValue = sin(sinPIInit + 2 * sinPIVariation * i);
        if (i < 0.0f) {
            sinValue = 0.0f;
        }
        [baseSinValues addObject:@(sinValue)];
        
        // 同時に各タイミングのcos値を取得
        // 円周上の右〜右上〜右へ移動（ex.0→45→0)
        double cosPIVariation = (M_PI * changeRate);
        double cosPIInit = 0.0f;
        double cosValue;
        if (i <= 0.5f) {
            cosValue = cos(cosPIInit + cosPIVariation * i);
        }
        else {
            cosValue = cos((cosPIInit + cosPIVariation/2.0f) - cosPIVariation * (i - 0.5f));
        }
        if (i < 0.0f) {
            cosValue = 0.0f;
        }
        [baseCosValues addObject:@(cosValue)];
    }
    
    // 上記で取得したsincosの動きをFramecountの範囲で繰り返す
    for (NSUInteger i = 0; i < frameCount; i++) {
        CATransform3D transform = CATransform3DMakeScale([[baseSinValues objectAtIndex:i] floatValue], [[baseCosValues objectAtIndex:i] floatValue], 1.0f);
        [values addObject:[NSNumber valueWithCATransform3D:transform]];
    }

    // KeyFrameAnimationを作る
    CAKeyframeAnimation *keyFrameAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    keyFrameAnimation.duration = duration;
    keyFrameAnimation.keyTimes = keytimes;
    keyFrameAnimation.values = values;
    // 繰り返し実行(HUGE_VALFを指定するとリピート)
    if (repeat) {
        keyFrameAnimation.repeatCount = HUGE_VALF;
    }
    else {
        keyFrameAnimation.repeatCount = 1.0f;
    }
    // 実行
    [self.layer addAnimation:keyFrameAnimation forKey:nil];
}
- (void)stopAllAnimation {
    self.transform = CGAffineTransformIdentity;
    [self.layer removeAllAnimations];
}
@end
