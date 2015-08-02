//
//  ZFMFTListCell.h
//  fortunemailapp
//
//  Created by 東屋 百合絵 on 2015/08/02.
//  Copyright (c) 2015年 Zappallas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZFMFTListCell : UICollectionViewCell

@property(weak,nonatomic)IBOutlet UILabel *nameLabel;
@property(weak,nonatomic)IBOutlet UILabel *evaluationLabel;
@property(weak,nonatomic)IBOutlet UIImageView *image;

-(void)setFortuneTellerInfo:(NSDictionary*)infoDic;
@end
