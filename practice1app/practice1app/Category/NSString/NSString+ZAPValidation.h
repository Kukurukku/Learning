//
//  NSString+ZAPValidation.h
//  koiuranai
//
//  Created by 日野　慎哉 on 2015/01/05.
//  Copyright (c) 2015年 Zappallas. All rights reserved.
//

// Framework
@import Foundation;

/*!
 @category ZAPValidation
 @abstract NSStringのバリデーションに使う処理をまとめたカテゴリ
 */
@interface NSString (ZAPValidation)

/*!
 @method isEmpty
 @abstract selfが空ではないかどうかチェックします
 @return YES:空か、半角/全角スペースのみ　NO:それ以外
 */
- (BOOL)isEmpty;

@end
