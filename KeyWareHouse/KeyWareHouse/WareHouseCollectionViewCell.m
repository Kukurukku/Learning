//
//  WareHouseCollectionViewCell.m
//  KeyWareHouse
//
//  Created by 東屋 百合絵 on 2015/06/04.
//  Copyright (c) 2015年 TestProject. All rights reserved.
//

#import "WareHouseCollectionViewCell.h"

@interface WareHouseCollectionViewCell(){
    NSDictionary *categoryDict;
}

@end

@implementation WareHouseCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    [self.superview setAlpha:0.0f];
    
    // カテゴリーを登録する
    categoryDict = [NSDictionary dictionaryWithObjectsAndKeys:
                     @"category_0.png",@"0",@"category_1.png",@"1",@"category_2.png",@"2",@"category_3.png",@"3",@"category_4.png",@"4",@"category_5.png",@"5",@"category_6.png",@"6",nil];
    
    _title.numberOfLines = 2;
}

/**
 画像と鍵の名前をセットする
 */
-(void)setKeyInfo:(NSString*)categoryID
     keyTexttitle:(NSString*)text{
    
    // タイトルを設定
    _title.text = text;
    
    // アイコンを設定
    NSString *imageName = [categoryDict objectForKey:categoryID];
    _categoryImage.image = [UIImage imageNamed:imageName];
    
}

@end
