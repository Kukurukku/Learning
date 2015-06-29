//
//  NSString+ZAPURLEncoding.h
//  koiuranai
//
//  Created by 日野　慎哉 on 2015/01/05.
//  Copyright (c) 2015年 Zappallas. All rights reserved.
//

// Framework
@import Foundation;

/*!
 @category ZAPURLEncoding
 @abstract NSStringをhttpリクエスト用にurlエンコードするためのカテゴリ
 */
@interface NSString (ZAPURLEncoding)

/*!
 @method stringByAddingPercentEscaping
 @discussion 自身をURLエンコードした文字列を返す。
 */
- (NSString *)stringByAddingPercentEscaping;

@end
