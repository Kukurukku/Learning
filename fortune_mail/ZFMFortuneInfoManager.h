//
//  ZFMFortuneInfoManager.h
//  fortunemailapp
//
//  Created by 東屋　百合絵 on 2015/07/27.
//  Copyright (c) 2015年 東屋　百合絵. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface ZFMFortuneInfoManager : AFHTTPSessionManager

+(ZFMFortuneInfoManager *)sharedManager;

-(void)registerFortuneInfo:(NSDictionary *)parameter completion:(void (^)(NSDictionary *results, NSError *error))block;

-(void)registerIDPW:(NSDictionary *)parameter completion:(void (^)(NSDictionary *results, NSError *error))block;

-(void)confirmIDPW:(NSDictionary *)parameter completion:(void (^)(NSDictionary *results, NSError *error))block;

-(void)getFortuneTellerInfo:(NSDictionary *)parameter completion:(void (^)(NSDictionary *results, NSError *error))block;

-(void)getImageFile:(NSString *)parameter completion:(void (^)(UIImage *result, NSError *error))block;
@end
