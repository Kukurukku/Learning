//
//  DetailStatusView.h
//  sentakushrine
//
//  Created by 東屋　百合絵 on 2015/04/21.
//  Copyright (c) 2015年 東屋　百合絵. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailStatusView : UIView

@property (strong,nonatomic)IBOutlet UILabel * nameLabel;

@property (strong,nonatomic)IBOutlet UILabel * japaneseLabel;

@property (strong,nonatomic)IBOutlet UILabel * chineseLabel;

@property (strong,nonatomic)IBOutlet UILabel * statusLabel;

@property (strong,nonatomic)IBOutlet UILabel * familyLabel;

@property (strong,nonatomic)IBOutlet UILabel * personalLabel;

@property (strong,nonatomic)IBOutlet UIImageView * image;
@end
