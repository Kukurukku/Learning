//
//  NSString+ZAPHelpers.h
//  movieCuration
//
//  Created by m_sugawara on 2015/03/31.
//  Copyright (c) 2015年 zappallas. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 @category ZAPHelpers
 @abstract カテゴライズしにくい追加処理をまとめたカテゴリ
 */
@interface NSString (ZAPHelpers)

/*!
 @method regexMatchStringsWithPattern:
 @param pattern 正規表現
 @return 正規表現パターン中の()内の文字列の配列を返します。※0番目は文字列全体を返します。
 */
- (NSArray *)regexMatchStringsWithPattern:(NSString *)pattern;

/*!
 @method regexMatchStringWithPattern:
 @param pattern 正規表現
 @return 正規表現パターン中の「最初」の()内の文字列を返します。
 */
- (NSString *)regexMatchStringWithPattern:(NSString *)pattern;

@end
