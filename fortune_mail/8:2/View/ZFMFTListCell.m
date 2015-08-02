//
//  ZFMFTListCell.m
//  fortunemailapp
//
//  Created by 東屋 百合絵 on 2015/08/02.
//  Copyright (c) 2015年 Zappallas. All rights reserved.
//

#import "ZFMFTListCell.h"
#import "ZFMFortuneInfoManager.h"

@implementation ZFMFTListCell

-(void)setFortuneTellerInfo:(NSDictionary*)infoDic{

    [self.nameLabel setText:[infoDic objectForKey:@"name"]];
    [self.evaluationLabel setText:[infoDic objectForKey:@"evaluation"]];
    
    [self setPicture:[infoDic objectForKey:@"imageURL"]];
}

-(void)setPicture:(NSString*)URL{
        
    ZFMFortuneInfoManager *manager = [ZFMFortuneInfoManager sharedManager];
    // TODO テスト用画像設定
    [manager getImageFile:@"http://localhost/beadsManager/imagesample.png" completion:^(UIImage *result ,NSError *error){
        if(error != nil) {
                
            // TODO エラー処理 処理失敗時アラート表示
            NSLog(@"エラーですORZ");
            return;
        } else {

            if(![result isEqual:nil]){
                // 画像を設定する
                [self.image setImage:result];
            } else {
            
                // TODO 画像がなければ、デフォルト画像を設定する
            }
            
        }
            
    }];

    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
