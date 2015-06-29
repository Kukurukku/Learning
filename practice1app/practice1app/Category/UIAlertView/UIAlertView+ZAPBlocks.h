//
//  UIAlertView+ZAPBlocks.h
//  koiuranai
//
//  Created by 日野　慎哉 on 2014/10/15.
//  Copyright (c) 2014年 Zappallas. All rights reserved.
//

// Framework
@import UIKit;

typedef void(^AlertViewcompletion)(UIAlertView *alertView, NSInteger buttonIndex);

/*!
 @category ZAPBlocks
 @abstract UIAlertViewのdelegateをblockで書き換えたカテゴリ
 */
@interface UIAlertView (ZAPBlocks) <UIAlertViewDelegate>

/*!
 @property completionBlock
 @abstract アラートのボタンがタップされた時のcallback
 @discussion 引数のbuttonIndexにタップされたボタンのindexが入ってくる。
 */
@property(nonatomic, copy, readonly)AlertViewcompletion completionBlock;

/*!
 @method initWithTitle:message:completion:cancelButtonTitle:otherButtonTitles:otherButtonTitles
 @abstract イニシャライザ
 @discussion UIAlertViewのインスタンスを生成する。
 @param title アラートのタイトル
 @param message アラートの本文
 @param cancelButtonTitle キャンセルボタン（一つ目のボタン）のタイトル
 @param otherButtonTitles 他のボタンのタイトル。可変なので必要なボタンの数だけ文字列を後ろに追加してください。
 */
- (id)initWithTitle:(NSString *)title message:(NSString *)message completion:(AlertViewcompletion)completionBlock cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...;

@end