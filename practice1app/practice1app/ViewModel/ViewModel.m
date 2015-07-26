//
//  ViewModel.m
//  practice1app
//
//  Created by 東屋　百合絵 on 2015/06/29.
//  Copyright (c) 2015年 東屋　百合絵. All rights reserved.
//


#import "ViewModel.h"

@interface ViewModel()

@property(nonatomic, readwrite)NSInteger count;

@end

@implementation ViewModel

#pragma mark Dealloc
- (void)dealloc {

}
#pragma mark -

#pragma mark Initializer
- (instancetype)init {
    self = [super init];
    if (self) {
        // write your initialize code.
        self.count = 0;
    }
    return self;
}
#pragma mark -

#pragma mark Class Methods
#pragma mark -

#pragma mark Public Methods
- (void)increaseCount {
self.count++;
}
#pragma mark -

#pragma mark Private Methods
#pragma mark -

#pragma mark Delegate
#pragma mark -

#pragma mark Action
#pragma mark -

/*
 桁数チェックメソッド
 
 【引数】
 targetString:桁数を判定する文字列
 num:正しい桁数
 
 */
-(BOOL)validNumber:(NSString*)targetString number:(NSInteger)num{

    NSString *target = targetString;
    if(target.length != num){
        return NO;
    }
    
    return YES;
}

@end
		
