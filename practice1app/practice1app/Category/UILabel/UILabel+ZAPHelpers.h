//
//  UILabel+ZAPHelpers.h
//  koiuranai
//
//  Created by 菅原　正展 on 2015/01/26.
//  Copyright (c) 2015年 Zappallas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (ZAPHelpers)

- (void)changeLineHeight:(CGFloat)lineHeight;

typedef NS_ENUM(NSInteger, ZAPLabelAnchor) {
    ZAPLabelAnchorTopLeft,
    ZAPLabelAnchorTopRight,
    ZAPLabelAnchorBottomLeft,
    ZAPLabelAnchorBottomRight,
    ZAPLabelAnchorCenter,
};
- (void)sizeToFitWithAnchor:(ZAPLabelAnchor)anchor;

@end
