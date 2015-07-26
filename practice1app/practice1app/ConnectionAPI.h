//
//  ConnectionAPI.h
//  practice1app
//
//  Created by 東屋 百合絵 on 2015/07/26.
//  Copyright (c) 2015年 東屋　百合絵. All rights reserved.
//

#import "AFHTTPSessionManager.h"
#import "AFHTTPRequestOperationManager.h"

@interface ConnectionAPI : AFHTTPRequestOperationManager
/*AFHTTPSessionManager
*/
+(ConnectionAPI *)sharedManager;

-(void)getWeather:(NSDictionary *)parameter completion:(void (^)(NSDictionary *results, NSError *error))block;
@end
