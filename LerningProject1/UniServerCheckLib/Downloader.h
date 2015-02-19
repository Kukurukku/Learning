//
//  Downloader.h
//  UranaiBase
//
//  Created by user on 10/08/10.
//  Copyright 2010 ZAPPALLAS, INC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCryptor.h>
#import <UIKit/UIKit.h>


/**
 * ダウンロードを要求するクラスが、
 * ダウンロードの 完了 または 失敗 の通知を受け取るために 実装するプロトコル.
 */
@protocol DownloaderDelegate
- (void)didDownload:(id)loader Results:(NSData*)loaddata;
- (void)failedDownload:(id)loader Error:(NSError*)err;
- (void)canceledDownliad:(id)loader;
@end

@interface Downloader : NSObject {

	bool cancelable;
	NSMutableData* bufReceive;

	NSMutableString* strUID;
	NSMutableString* strEncryptedKey;

	id<DownloaderDelegate> delegate;

	NSURLConnection* dlContext;
}

@property (readonly, getter=isCancelable) bool cancelable;
@property (readonly, getter=isBusy) bool busy;
@property (nonatomic, strong) id <DownloaderDelegate> delegate;

+ (Downloader*)getDownloader;

- (bool)startDownloadURL:(NSString*)baseURL
				 WithSID:(NSString*)sid
			  Parameters:(NSString*)param
			IsCancelable:(bool)cancel
				Delegate:(id)listener;
- (void)cancelDownload;
- (void)updateEncryptKeyWithUID:(NSString*)uid
					 InitVector:(NSString*)iv
							Key:(NSString*)key;
@end
