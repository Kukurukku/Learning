//
//  WareHouseCollectionViewCell.h
//  KeyWareHouse
//
//  Created by 東屋 百合絵 on 2015/06/04.
//  Copyright (c) 2015年 TestProject. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WareHouseCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIImageView *categoryImage;

-(void)setKeyInfo:(NSString*)categoryID
     keyTexttitle:(NSString*)text;
@end
