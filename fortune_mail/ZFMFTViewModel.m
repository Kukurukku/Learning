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
//mod8/2
@property(nonatomic, readwrite)NSMutableArray *userList;
@property(nonatomic, readwrite)BOOL isListUpdate;

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
        self.isListUpdate = NO;
        
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
    
    self.userList = [NSMutableArray array];
}
/**
 mod8/2
 占い師一覧をサーバから取得するメソッド
 */
-(void)getFortuneTellerList{
    
    // tODOテスト用の値と差し替え
    // TODO テストコード
    NSDictionary *array =@{@"name":@"マドモワゼル",@"evaluation":@"★2",@"imageURL":@"http://localhost/beadsManager/imagesample.png"};
    
    [self.userList addObject:array];
    self.isListUpdate = YES;
    /*ZFMFortuneInfoManager *manager = [ZFMFortuneInfoManager sharedManager];
     [manager getFortuneTellerList:nil completion:^(NSDictionary *results ,NSError *error){
     if(error != nil) {
     // TODO エラー処理 処理失敗時アラート表示
     NSLog(@"エラーですORZ");
     return;
     } else {
     
     // TODO
     if(results[@"list"] || ![results[@"list"] isEqual:nil]){
     // 占い師の一覧をarrayに詰める
     self.userList = results[@"list"];
     
     } else {
     // TODO 占い師情報取得失敗時処理
     
     }
     }
     
     }];*/
    
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
            //mod8/2 とれなかったらエラーにする
            self.isSuccessGetInfo = NO;
            NSLog(@"エラーですORZ");
            return;
        } else {
            
            // TODO
            if(results.count > 0){
                // 占い師情報取得成功時に、各種プロパティに設定する。
                [self setFortuneTellerInfo:results];
            } else {
                // TODO 占い師情報取得失敗時処理
                //mod8/2 とれなかったらエラーにする
                self.isSuccessGetInfo = NO;
                
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
                //mod8/2 画像がnilならデフォルト画像（今は用意していない）を設定し、
                // 値があるならimageを設定。ここで他の情報の設定と、ステータスの変更を行う
                if(result != nil){
                    self.fortuneTellerImage = result;
                } else{
                    // TODO サンプル画像を先生のimageviewに設定する
                }
                
                self.fortuneTellerID = [parameter objectForKey:@"id"];
                self.fortuneTellerName = [parameter objectForKey:@"fortuneteller_id"];
                self.spCategory = [parameter objectForKey:@"category"];
                self.divination = [parameter objectForKey:@"divination"];
                self.evaluation = [parameter objectForKey:@"evaluation"];
                self.shortMessage = [parameter objectForKey:@"showrt_message"];
                self.schedule = [parameter objectForKey:@"schedule"];
                self.itemKind = [parameter objectForKey:@"item_kind"];
                
                self.isSuccessGetInfo = YES;
            }
            
        }];
        
    } else {
        self.isSuccessGetInfo = NO;
    }
    
}

@end
