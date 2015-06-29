//
//  UIView+ZAPRect.h
//  koiuranai
//
//  Created by 日野　慎哉 on 2015/01/05.
//  Copyright (c) 2015年 Zappallas. All rights reserved.
//

// Framework
@import UIKit;

/*!
 @category ZAPRect
 @abstract 座標、サイズ関連の追加処理をまとめたカテゴリ
 */
@interface UIView (ZAPRect)

/*!
 @property bottom
 @abstract viewのheight + y座標の位置
 */
@property(nonatomic)CGFloat bottom;

/*!
 @property trailing
 @abstract viewのwidth + x座標の位置
 */
@property(nonatomic)CGFloat trailing;

/*!
 @property x
 @abstract origin.xの値
 */
@property(nonatomic)CGFloat x;

/*!
 @property y
 @abstract origin.yの値
 */
@property(nonatomic)CGFloat y;

/*!
 @property width
 @abstract size.widthの値
 */
@property(nonatomic)CGFloat width;

/*!
 @property height
 @abstract size.heightの値
 */
@property(nonatomic)CGFloat height;

/*!
 @property centerX
 @abstract center.xの値
 */
@property(nonatomic)CGFloat centerX;

/*!
 @property centerY
 @abstract center.yの値
 */
@property(nonatomic)CGFloat centerY;

/*!
 @property origin
 @abstract frame.originの値
 */
@property(nonatomic)CGPoint origin;

/*!
 @property size
 @abstract frame.sizeの値
 */
@property(nonatomic)CGSize size;

/*!
 @property alignTop:bottom:
 @abstract 指定したtop, bottomに合わせてviewの高さを拡縮する
 @discussion top = 100, bottom = 200にした場合はorigin.y = 100, size.height = 200になる。top > bottomの時は何もしない。
 */
- (void)alignTop:(CGFloat)top bottom:(CGFloat)bottom;

@end
