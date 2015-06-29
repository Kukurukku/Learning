//
//  NSArray+ZAPHelpers.h
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
@interface NSArray (ZAPHelpers)

/*!
 @method objectAtIndexIfExists:
 @abstract 配列から指定したインデックスにあるオブジェクトを返す。
 @return 存在しない場合はnilを返す
 */
- (id)objectAtIndexIfExists:(NSUInteger)index;

/*!
 @method shuffled
 @abstract 配列をシャッフルする
 */
- (NSArray *)shuffled;

@end
