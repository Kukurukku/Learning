//
//  NSLayoutConstraint+ZAPHelpers.h
//  movieCuration
//
//  Created by m_sugawara on 2015/04/08.
//  Copyright (c) 2015年 zappallas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSLayoutConstraint (ZAPHelpers)

/*!
 @method setPriorityIfNeeded
 @abstract 必要がある場合だけPriorityを設定します。
 @param priority 変更したいPriority
 */
- (void)setPriorityIfNeeded:(UILayoutPriority)priority;

@end
