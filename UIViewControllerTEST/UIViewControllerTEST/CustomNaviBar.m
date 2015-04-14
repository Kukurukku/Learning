//
//  CustomNaviBar.m
//  UIViewControllerTEST
//
//  Created by 東屋　百合絵 on 2015/04/07.
//  Copyright (c) 2015年 東屋　百合絵. All rights reserved.
//

#import "CustomNaviBar.h"
#define NAVIGATION_BTN_MARGIN 500

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
    
    // すべてのナビバーのタイトルの位置を調整する
    [[UINavigationBar appearance] setTitleVerticalPositionAdjustment:-10 forBarMetrics:UIBarMetricsDefault];
    
    /*UINavigationItem *navigationItem = [self topItem];
    
    UIView *subview = [[navigationItem rightBarButtonItem] customView];
    
    if (subview) {
        
        CGRect subviewFrame = subview.frame;
        subviewFrame.origin.x = self.frame.size.width - subview.frame.size.width - NAVIGATION_BTN_MARGIN;
        subviewFrame.origin.y = (self.frame.size.height - subview.frame.size.height) / 2;
        
        [subview setFrame:subviewFrame];
    }
    
    subview = [[navigationItem leftBarButtonItem] customView];
    
    if (subview) {
        
        CGRect subviewFrame = subview.frame;
        subviewFrame.origin.x = NAVIGATION_BTN_MARGIN;
        subviewFrame.origin.y = (self.frame.size.height - subview.frame.size.height) / 2;
        
        [subview setFrame:subviewFrame];
    }
     */
}

- (void)configFrame:(UIView *)v
{
    CGRect frame = v.frame;
    frame.origin.y = -5;
    v.frame = frame;
}


@end
