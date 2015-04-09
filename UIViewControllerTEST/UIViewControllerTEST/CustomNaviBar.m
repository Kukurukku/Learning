//
//  CustomNaviBar.m
//  UIViewControllerTEST
//
//  Created by 東屋　百合絵 on 2015/04/07.
//  Copyright (c) 2015年 東屋　百合絵. All rights reserved.
//

#import "CustomNaviBar.h"

@implementation CustomNaviBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (CGSize)sizeThatFits:(CGSize)size
{
    CGSize newSize = self.frame.size;
    newSize.height = newSize.height;
    [self setTitleVerticalPositionAdjustment:3 forBarMetrics:UIBarMetricsDefault];
    return newSize;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    for (UINavigationItem *v in self.items) {
        if([v isKindOfClass:[UINavigationItem class]]){
            for(UIBarButtonItem *item in v.rightBarButtonItems){
                [self configFrame:item.customView];
            }
            for(UIBarButtonItem *item in v.leftBarButtonItems){
                [self configFrame:item.customView];
            }
        }
    }
}

- (void)configFrame:(UIView *)v
{
    CGRect frame = v.frame;
    frame.origin.y = 5;
    v.frame = frame;
}


@end
