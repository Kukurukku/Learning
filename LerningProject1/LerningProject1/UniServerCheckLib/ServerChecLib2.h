//
//  ServerChecLib2.h
//  ServerChecLib2
//
//  Created by tech-user on 2014/01/29.
//  Copyright (c) 2014年 zapp. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LogicLoaderDelegate;

@interface ServerChecLib2 : NSObject{
    __unsafe_unretained id<LogicLoaderDelegate> _delegate;
}

@property (nonatomic, assign) id<LogicLoaderDelegate> delegate;

//ViewControllerから呼ばれるサンプルメソッド
- (void)callDelegate;

@end

@protocol LogicLoaderDelegate<NSObject>
//デリゲート経由で呼ばれるメソッドを宣言
@optional
- (void)sample;


@end
