//
//  NSDate+ZAPHelpers.h
//  koiuranai
//
//  Created by 日野　慎哉 on 2015/01/05.
//  Copyright (c) 2015年 Zappallas. All rights reserved.
//

// Framework
@import Foundation;

/*!
 @category ZAPHelpers
 @abstract カテゴライズしにくい追加処理をまとめたカテゴリ
 */
@interface NSDate (ZAPHelpers)

/*!
 @abstract 指定日付を返す
 @param year 年
 @param month 月
 @param day 日
 @return 指定された日付
 */
+ (NSDate*)dateWithYear:(NSInteger)year Month:(NSInteger)month Day:(NSInteger)day;

/*!
 @abstract NSDateのうち、時分秒をクリアします(hh:mm:ss を 00:00:00 にする)
 @return 時分秒のみクリアされたdate
 */
- (NSDate*)dateByClearingTime;

@end
