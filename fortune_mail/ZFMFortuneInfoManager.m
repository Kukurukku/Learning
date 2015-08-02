//
//  ZFMFortuneInfoManager.m
//  fortunemailapp
//
//  Created by 東屋　百合絵 on 2015/07/27.
//  Copyright (c) 2015年 東屋　百合絵. All rights reserved.
//

#import "ZFMFortuneInfoManager.h"

@implementation ZFMFortuneInfoManager

+ (ZFMFortuneInfoManager*)sharedManager{
    
    static ZFMFortuneInfoManager *manager = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        manager = [[self alloc]init];
    });
    
    return manager;
    
}

/**
 占い基本情報登録メソッド
 */
-(void)registerFortuneInfo:(NSDictionary *)parameter completion:(void (^)(NSDictionary *results, NSError *error))block{
    
    NSString * API = APIURIProfileSave;
    
    /* 占い情報をPOST */
    [self POST:[self setupURL:API] parameters:parameter success:^(NSURLSessionDataTask *task, id responseObject) {
        // 取得成功時
        if (block) block(responseObject, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        // 取得失敗時
        if (block) block(nil, error);
        
    }];
    
}


/**
 IDPW登録メソッド
 */
-(void)registerIDPW:(NSDictionary *)parameter completion:(void (^)(NSDictionary *results, NSError *error))block{
    
    NSString * API = APIURIUserRegist;
    
    /* 登録完了をPOST */
    [self POST:[self setupURL:API] parameters:parameter success:^(NSURLSessionDataTask *task, id responseObject) {
        // 処理成功時
        if (block) block(responseObject, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        // 処理失敗時
        if (block) block(nil, error);
        
    }];
    
}

/**
 IDPW登録完了
 */
-(void)confirmIDPW:(NSDictionary *)parameter completion:(void (^)(NSDictionary *results, NSError *error))block{
    
    NSString * API = APIURIUserConfirm;
    
    /* 登録完了をPOST */
    [self POST:[self setupURL:API] parameters:parameter success:^(NSURLSessionDataTask *task, id responseObject) {
        // 処理成功時
        if (block) block(responseObject, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        // 処理失敗時
        if (block) block(nil, error);
        
    }];
    
}

/**
 mod8/2
 占い師一覧取得
 */
-(void)getFortuneTellerList:(NSDictionary *)parameter completion:(void (^)(NSDictionary *results, NSError *error))block{
    
    NSString * API = APIURIFortunetellerList;
    
    /* 占い師IDで情報をGETする */
    [self GET:[self setupURL:API] parameters:parameter success:^(NSURLSessionDataTask *task, id responseObject) {
        // 処理成功時
        if (block) block(responseObject, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        // 処理失敗時
        if (block) block(nil, error);
        
    }];
    
}
/**
 占い師詳細情報取得
 */
-(void)getFortuneTellerInfo:(NSDictionary *)parameter completion:(void (^)(NSDictionary *results, NSError *error))block{
    
    NSString * API = APIURIFortunetellerDetail;
    
    /* 占い師IDで情報をGETする */
    [self GET:[self setupURL:API] parameters:parameter success:^(NSURLSessionDataTask *task, id responseObject) {
        // 処理成功時
        if (block) block(responseObject, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        // 処理失敗時
        if (block) block(nil, error);
        
    }];
    
}

/**
 画像取得
 */
-(void)getImageFile:(NSString *)parameter completion:(void (^)(UIImage *result, NSError *error))block{
    
    NSString * API = APIURIImageLoad;
    
    self.responseSerializer = [AFImageResponseSerializer serializer];
    
    /* 画像URLから対象の画像をGET */
    //8/2mod 占い師一覧のため。画像取得の方法考えた方がいいかもしれない
    //[self GET:[self setupURL:API] parameters:parameter success:^(NSURLSessionDataTask *task, UIImage *image) {
    [self GET:parameter parameters:nil success:^(NSURLSessionDataTask *task, UIImage *image) {
        // 処理成功時
        if (block) block(image, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        // 処理失敗時
        if (block) block(nil, error);
        
    }];
    
}

/**
 URL整形メソッド
 */
-(NSString*)setupURL:(NSString*)URI{
    NSString * string = [BaseURL stringByAppendingString:URI];
    return string;
}
@end
