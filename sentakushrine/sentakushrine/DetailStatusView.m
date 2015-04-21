//
//  DetailStatusView.m
//  sentakushrine
//
//  Created by 東屋　百合絵 on 2015/04/21.
//  Copyright (c) 2015年 東屋　百合絵. All rights reserved.
//

#import "DetailStatusView.h"
@interface DetailStatusView()

@property NSDictionary *person;
@end

@implementation DetailStatusView



-(instancetype)initWithProfile:(NSDictionary*)person  {
    self = [super init];
    if (self) {
        self.person = person;
        [self initWithNib];
    }
    return self;
}

- (void) initWithNib {

    // 自身を作成する
    DetailStatusView *detailStatusView = [[[NSBundle mainBundle]    loadNibNamed:@"DetailStatusView"
                                                                      owner:self
                                                                    options:nil] objectAtIndex:0];
    detailStatusView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [self addSubview:detailStatusView];
    
    // 初期化時に得たデータで画面に表示するデータを設定する
    self.nameLabel.text = [self.person objectForKey:@"name"];
    self.japaneseLabel.text = [self.person objectForKey:@"japanese"];
    self.chineseLabel.text = [self.person objectForKey:@"chinese"];
    self.statusLabel.text = [self.person objectForKey:@"status"];
    self.familyLabel.text = [self.person objectForKey:@"family"];
    self.personalLabel.text = [self.person objectForKey:@"personal"];

}

@end
