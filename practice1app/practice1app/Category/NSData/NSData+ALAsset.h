//
//  NSData+ALAsset.h
//  koiuranai
//
//  Created by 日野　慎哉 on 2015/01/06.
//  Copyright (c) 2015年 Zappallas. All rights reserved.
//

// Framework
@import Foundation;
@import AssetsLibrary;

/*!
 @category ALAsset
 @abstract ALAssetに関係した処理をまとめたカテゴリ
 */
@interface NSData (ALAsset)

/*!
 @method dataFromAsset:asset
 @abstract ALAssetをNSDataに変換する
 */
+ (NSData *)dataFromAsset:(ALAsset *)asset;

@end
