//
//  UIColor+ZAPHex.h
//  koiuranai
//
//  Created by 日野　慎哉 on 2015/01/05.
//  Copyright (c) 2015年 Zappallas. All rights reserved.
//

// Framework
@import UIKit;

/*!
 @category ZAPHex
 @abstract 16進数リテラルを使ってUIColorを生成するためのカテゴリ
 */
@interface UIColor (ZAPHex)

/*!
@method colorWithHex:
@abstract UIColorを16進数リテラルから生成します。
@discussion 0x から始まる値は16進数として扱われます。
白（r, g, b すべて255）をこのメソッドで取得したい場合は「0xFFFFFFFF」を引数に渡してください。
例：UIColor *white = [Util colorWithHex:0xFFFFFFFF];
*/
+ (UIColor*)colorWithHex:(uint32_t)hex;

@end
