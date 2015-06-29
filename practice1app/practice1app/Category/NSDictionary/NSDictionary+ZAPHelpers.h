//
//  NSDictionary+ZAPHelpers.h
//  movieCuration
//
//  Created by m_sugawara on 2015/04/01.
//  Copyright (c) 2015年 zappallas. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 @category ZAPHelpers
 @abstract カテゴライズしにくい追加処理をまとめたカテゴリ
 */
@interface NSDictionary (ZAPHelpers)

/*!
 @method objectForKeyIfExists:
 @param key 取得する辞書のキー
 @abstract 辞書から指定したキーにあるオブジェクトを返す。
 @return 存在しない場合はnilを返す
 */
- (id)objectForKeyIfExists:(NSString *)key;


@end
