//
//  UIView+ZAPHelpers.h
//  koiuranai
//
//  Created by 日野　慎哉 on 2015/01/05.
//  Copyright (c) 2015年 Zappallas. All rights reserved.
//

// Framework
@import UIKit;

/*!
 @category ZAPHelpers
 @abstract カテゴライズしにくい追加処理をまとめたカテゴリ
 */
@interface UIView (Helpers)


/*!
 @method findFirstResponder
 @abstract フォーカスがあたっているビューを取得します
 */
- (UIResponder *)findFirstResponder;

/*!
 @method setExclusiveTouch:recurcive:
 @abstract 同時押し禁止処理。再帰的に実行。
 @param exclusiveTouch YES = 同時押しできない、NO = 同時押しできる
 @param recursive subviewに対して再帰的に同じ処理をする場合はYES
 */
- (void)setExclusiveTouch:(BOOL)exclusiveTouch recursive:(BOOL)recursive;

@end
