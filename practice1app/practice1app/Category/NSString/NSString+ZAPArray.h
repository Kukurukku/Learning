//
//  NSString+ZAPArray.h
//  koiuranai
//
//  Created by 日野　慎哉 on 2015/01/05.
//  Copyright (c) 2015年 Zappallas. All rights reserved.
//

// Framework
@import Foundation;

/*!
 @category ZAPArray
 @abstract NSArrayからNSStringを作るような処理をまとめたカテゴリ
 */
@interface NSString (ZAPArray)

/*!
 @abstract NSArrayの内容をseperatorで区切って、NSStringに一括出力します
 @param array 全件取得するNSArray
 @param separator 区切り文字
 @return NSArrayの内容を全件separatorで区切ったNSString
 */
+ (NSString *)stringFromArray:(NSArray *)array separateBy:(NSString *)separator;

@end
