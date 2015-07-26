//
//  ConnectionAPI.m
//  practice1app
//
//  Created by 東屋 百合絵 on 2015/07/26.
//  Copyright (c) 2015年 東屋　百合絵. All rights reserved.
//

#import "ConnectionAPI.h"
#import <CoreLocation/CoreLocation.h>

/* ★★fortunemail用★★ */
static NSString * const baseURL = @"http://api.openweathermap.org/data/2.5/weather?units=metric&lat=%f&lon=%f";

@implementation ConnectionAPI

+ (ConnectionAPI*)sharedManager{

    static ConnectionAPI *manager = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        manager = [[self alloc]init];
    });
    
    return manager;
    
}

/**
 お天気情報取得メソッド
 */
-(void)getWeather:(NSDictionary *)parameter completion:(void (^)(NSDictionary *results, NSError *error))block{

    NSString *baseUrlString = baseURL;
    CLLocationDegrees latitude = [NSString stringWithFormat:@"%@",[parameter objectForKey:@"latitude"]].doubleValue;
    CLLocationDegrees longitude = [NSString stringWithFormat:@"%@",[parameter objectForKey:@"longitude"]].doubleValue;
    
    /* AFHTTPRequestOperationManager使用の場合 */
    NSString *urlString = [NSString stringWithFormat:baseUrlString,latitude,longitude];
    
    [self GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject){
        // 取得成功時
        if (block) block(responseObject, nil);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error){
        // 取得失敗時
        if (block) block(nil, error);
    }];
    
    
    
    /* AFHTTPSessionManager使用の場合
    [self GET:urlString parameters:nil success:^(NSURLSessionDataTask *task, id responseObject){
        // 取得成功時
        if (block) block(responseObject, nil);
    
    } failure:^(NSURLSessionDataTask *task, NSError *error){
        
        // 取得失敗時
        if (block) block(nil, error);
    
    }];*/
    
    
    /* ★★fortunemail用★★ */
    
    /*NSDictionary *dic = @{@"name":self.name,@"birthday":self.birthday,@"sex":self.name.sex,@"bloodtype":self.name.bloodtype};
    
    [self POST:baseURL parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject){
        // 取得成功時
        if (block) block(responseObject, nil);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error){
        // 取得失敗時
        if (block) block(nil, error);
    }];*/
}
@end
