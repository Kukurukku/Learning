//
//  KeyChainModel.m
//  practice1app
//
//  Created by 東屋　百合絵 on 2015/07/08.
//  Copyright (c) 2015年 東屋　百合絵. All rights reserved.
//

#import "KeyChainModel.h"

#import "UICKeyChainStore.h"

@interface KeyChainModel()

@property (readwrite,nonatomic)NSString* infoData;

@end

@implementation KeyChainModel

-(void)dealloc{

    
}

-(instancetype)init{
    self = [super init];
    
    if(self ){
        self.infoData = @"";
    }
    
    return self;
}

-(void)saveData{

}

-(void)loadData{
    
}
-(void)deleteData{
    
}
@end
