//
//  NSData+ALAsset.m
//  koiuranai
//
//  Created by 日野　慎哉 on 2015/01/06.
//  Copyright (c) 2015年 Zappallas. All rights reserved.
//

#import "NSData+ALAsset.h"

@implementation NSData (ALAsset)

+ (NSData *)dataFromAsset:(ALAsset *)asset {
    // 取得したデータをUserDefault保存用にNSDataに変換する
    ALAssetRepresentation *assetRepresentation = [asset defaultRepresentation];
    // 表現のためのbufferポインタを返します
    Byte *buffer = (Byte*)malloc((long)assetRepresentation.size);
    // バッファ長を取得します
    NSUInteger buffered = [assetRepresentation getBytes:buffer fromOffset:0.0 length:(long)assetRepresentation.size error:nil];
    // 上記のバッファから指定バッファ長のデータをコピーして、かつ完了後に確保したメモリを解放する
    NSData *data = [NSData dataWithBytesNoCopy:buffer length:buffered freeWhenDone:YES];
    
    return data;
}


@end
