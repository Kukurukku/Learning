//
//  Logic.h
//  UranaiBase
//
//  Created by user on 10/08/10.
//  Copyright 2010 ZAPPALLAS, INC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Downloader.h"

#define STATUS_NONE 0
#define STATUS_DOWNLOAD 1
#define STATUS_PARSE 2

#define LOGIC_TYPE_MOONPHASE	1
#define LOGIC_TYPE_DAILY		2
#define LOGIC_TYPE_ZODIACSIGN	3

/**
 * ダウンロードを要求するクラスが、
 * ダウンロードの 完了 または 失敗 の通知を受け取るために 実装するプロトコル.
 */
@protocol LogicLoaderDelegate
- (void)didLoadLogicResults:(id)logicloader;
- (void)failedLoadLogicResults:(id)logicloader Error:(NSError*)error;
- (void)abortLoadLogicResults:(id)logicloader;
@end

@interface Logic : NSObject <DownloaderDelegate,NSXMLParserDelegate> {

	int type;

	// 作業用.
	int status;
	int parseStatus;
	NSData* loadedXML;
	NSMutableString* loadingElement;
	NSString*	textResultCode;

	// リスナー.
	id<LogicLoaderDelegate> delegate;

}

@property (assign,readonly)int type;
@property (nonatomic, strong) id<LogicLoaderDelegate> delegate;

/**
 * 現在の設定でダウンロード開始。
 * 設定が足りない / すでに何かダウンロード中の場合はなにもしないで false を返す.
 */
- (bool)download;

/**
 * ダウンロード中止.
 */
- (void)cancelDownload;

/**
 * 状態取得（未実装）.
 */
- (int)getStatus;

/**
 * サブルーチン.
 * NSDateオブジェクトからYYYYMMDDで日付文字列を生成して返す.
 */
- (NSString*)dateStringFromDate:(NSDate*)date;

/**
 * サブルーチン.
 * NSDateオブジェクトからHHMMSSで時刻文字列を生成して返す.
 */
- (NSString*)timeStringFromDate:(NSDate*)date;


@end
