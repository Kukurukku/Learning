//
//  ZFMFTViewModel.h
//  fortunemailapp
//
//  Created by 東屋　百合絵 on 2015/07/31.
//  Copyright (c) 2015年 Zappallas. All rights reserved.
//

@import Foundation;

@interface ZFMFTViewModel : NSObject

#pragma mark 占い師プロフィール用プロパティ

/*!
 @property fortuneTellerID
 @abstract 占い師のiD
 */
@property (nonatomic,strong)NSString* fortuneTellerID;

/*!
 @property fortuneTellerName
 @abstract 占い師の名前
 */
@property (nonatomic,strong)NSString* fortuneTellerName;


/*!
 @property fortuneTellerImage
 @abstract 占い師の画像
 */
@property (nonatomic,strong)UIImage* fortuneTellerImage;

/*!
 @property spCategory
 @abstract 得意カテゴリ
 */
@property (nonatomic,strong)NSString* spCategory;
/*!
 @property divination
 @abstract 占術
 */
@property (nonatomic,strong)NSString* divination;

/*!
 @property evaluation
 @abstract 評価
 */
@property (nonatomic,strong)NSString* evaluation;

/*!
 @property shortMessage
 @abstract ひとこと
 */
@property (nonatomic,strong)NSString* shortMessage;

/*!
 @property schedule
 @abstract お休み状況
 */
@property (nonatomic,strong)NSString* schedule;

/*!
 @property itemKind
 @abstract 商品種別 (無料、1000円、5000円、オプション)
 */
@property (nonatomic,strong)NSString* itemKind;

#pragma mark -

#pragma mark KVOプロパティ
// ユーザデータ取得成功失敗ステータス
@property(nonatomic, readonly)BOOL isSuccessGetInfo;

#pragma mark -


/*!
 @method getFortuneTellerInfo
 @param NSString ftID 占い師のID
 @abstract 占い師のIDから占い師の詳細情報を取得する
 */
- (void)getFortuneTellerInfo:(NSString*)ftID;


/*!
 @method setFortuneTellerInfo
 @param NSDictionary parameter サーバから取得した占い師情報詳細
 @abstract サーバから取得した値を、各種プロパティに格納する
 */
- (void)setFortuneTellerInfo:(NSDictionary*)parameter;

@end
