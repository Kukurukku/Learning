//
//  UILabel+ZAPHelpers.m
//  koiuranai
//
//  Created by 菅原　正展 on 2015/01/26.
//  Copyright (c) 2015年 Zappallas. All rights reserved.
//

#import "UILabel+ZAPHelpers.h"

@implementation UILabel (ZAPHelpers)

- (void)changeLineHeight:(CGFloat)lineHeight {
    if (!lineHeight) {
        return;
    }
    if (!self.text) {
        return;
    }
    // paragraphStyle
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineHeightMultiple = lineHeight;
    
    // 文字列の属性を設定
    NSDictionary *attributeDic = @{ NSFontAttributeName:self.font,
                                    NSForegroundColorAttributeName:self.textColor,
                                    NSParagraphStyleAttributeName:paragraphStyle};
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:self.text attributes:attributeDic];
    self.attributedText = attributedString;
}
- (void)sizeToFitWithAnchor:(ZAPLabelAnchor)anchor {
    CGRect frame = self.frame;
    [self sizeToFit];
    switch (anchor) {
        case ZAPLabelAnchorTopLeft:
            break;
        case ZAPLabelAnchorTopRight:
            self.x = frame.origin.x + frame.size.width - self.width;
            break;
        case ZAPLabelAnchorBottomLeft:
            self.y = frame.origin.y + frame.size.height - self.height;
            break;
        case ZAPLabelAnchorBottomRight:
            self.x = frame.origin.x + frame.size.width - self.width;
            self.y = frame.origin.y + frame.size.height - self.height;
            break;
        case ZAPLabelAnchorCenter:
            self.centerX = CGRectGetMidX(frame);
            self.centerY = CGRectGetMidY(frame);
            break;
    }
}

@end
