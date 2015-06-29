//
//  NSMutableDictionary+ZAPHelpers.h
//  koiuranai
//
//  Created by 菅原　正展 on 2015/01/09.
//  Copyright (c) 2015年 Zappallas. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 @category ZAPHelpers
 @abstract カテゴライズしにくい追加処理をまとめたカテゴリ
 */
@interface NSMutableDictionary (ZAPHelpers)

/*!
 * @abstract NSMutableDictionaryに追加するObjectがnullでなければ追加する
 * @return YES:NSMutableDictinaryにobjectを追加 NO:追加しない（objectがnull）
 */
-(BOOL)setObjectOrNil:(id)objectOrNil forKey:(id<NSCopying>)key;

@end
