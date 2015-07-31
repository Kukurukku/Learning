//
//  ZFMFTViewModel.m
//  fortunemailapp
//
//  Created by 東屋　百合絵 on 2015/07/31.
//  Copyright (c) 2015年 Zappallas. All rights reserved.
//

#import "ZFMFTViewModel.h"
#import "ZFMFortuneInfoManager.h"

@interface ZFMFTViewModel()
// ユーザデータ取得成功失敗ステータス
@property(nonatomic, readwrite)BOOL isSuccessGetInfo;

@end
@implementation ZFMFTViewModel

#pragma mark Dealloc
- (void)dealloc {
    
}
#pragma mark -

#pragma mark Initializer
- (instancetype)init {
    self = [super init];
    if (self) {
        // write your initialize code.
        // KVO値を初期化
        self.isSuccessGetInfo = NO;
        
        // 占い師情報初期化
        [self initProperty];
    }
    return self;
}
#pragma mark -

/**
 TODO 占い師情報初期化メソッド
 */
-(void)initProperty{
    
    self.fortuneTellerID = nil;
    self.fortuneTellerName = nil;
    self.spCategory = nil;
    self.divination = nil;
    self.evaluation = nil;
    self.shortMessage = nil;
    self.schedule = nil;
    self.itemKind = nil;
}

/**
 占い師IDでサーバから占い師情報を取得するメソッド
 */
-(void)getFortuneTellerInfo:(NSString *)ftID{
    
    NSDictionary *dic = @{@"id":ftID};
    
    ZFMFortuneInfoManager *manager = [ZFMFortuneInfoManager sharedManager];
    [manager getFortuneTellerInfo:dic completion:^(NSDictionary *results ,NSError *error){
        if(error != nil) {
            
            // TODO エラー処理 処理失敗時アラート表示
            NSLog(@"エラーですORZ");
            return;
        } else {
            
            // TODO
            if(results.count > 0){
                // 占い師情報取得成功時に、各種プロパティに設定する。
                [self setFortuneTellerInfo:results];
            } else {
                // TODO 占い師情報取得失敗時処理
                
            }
        }
        
    }];
    
}


/**
 サーバから取得した値を、各種プロパティに格納する
 */
- (void)setFortuneTellerInfo:(NSDictionary*)parameter{

    if(parameter != nil) {
        ZFMFortuneInfoManager *manager = [ZFMFortuneInfoManager sharedManager];
        [manager getImageFile:[parameter objectForKey:@"image_url"] completion:^(UIImage *result ,NSError *error){
            if(error != nil) {
                
                // TODO エラー処理 処理失敗時アラート表示
                NSLog(@"エラーですORZ");
                return;
            } else {
                
                // TODO 画像を設定
                self.fortuneTellerImage = result;
            }
            
        }];

        self.fortuneTellerID = [parameter objectForKey:@"id"];
        self.fortuneTellerName = [parameter objectForKey:@"fortuneteller_id"];
        self.spCategory = [parameter objectForKey:@"category"];
        self.divination = [parameter objectForKey:@"divination"];
        self.evaluation = [parameter objectForKey:@"evaluation"];
        self.shortMessage = [parameter objectForKey:@"showrt_message"];
        self.schedule = [parameter objectForKey:@"schedule"];
        self.itemKind = [parameter objectForKey:@"item_kind"];
        
        self.isSuccessGetInfo = YES;
    } else {
        self.isSuccessGetInfo = NO;
    }

}





@end
