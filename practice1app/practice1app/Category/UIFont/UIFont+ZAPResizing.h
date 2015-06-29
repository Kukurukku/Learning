//
//  UIFont+ZAPResizing.h
//  koiuranai
//
//  Created by 日野　慎哉 on 2015/01/26.
//  Copyright (c) 2015年 Zappallas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (ZAPResizing)


/*!
 @method fontWithScale:
 @abstract 指定したscaleでリサイズしたフォントを返します。
 @param scale 倍率
 */
- (UIFont *)fontWithScale:(CGFloat)scale;

@end
