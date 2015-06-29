//
//  NSString+ZAPDate.h
//  koiuranai
//
//  Created by 日野　慎哉 on 2015/01/05.
//  Copyright (c) 2015年 Zappallas. All rights reserved.
//

// Framework
@import Foundation;

/*!
 @category ZAPDate
 @abstract NSDateからNSStringを作るような処理をまとめたカテゴリ
 */
@interface NSString (ZAPDate)

/*!
 @abstract NSDateをNSStringに変換します
 @param date 変換するNSDate
 @param format 取得したいフォーマット形式
 @return 変換後のNSString
 */
+ (NSString *)stringFromDate:(NSDate *)date format:(NSString *)format;

@end
