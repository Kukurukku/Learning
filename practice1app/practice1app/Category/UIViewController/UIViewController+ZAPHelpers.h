//
//  UIViewController+ZAPHelpers.h
//  koiuranai
//
//  Created by 日野　慎哉 on 2015/02/04.
//  Copyright (c) 2015年 Zappallas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ZAPHelpers)

/*!
 @method findPresentedViewControllerRecursively
 @abstract モーダルで表示されているviewControllerを再帰的に検索します
 */
- (UIViewController *)findPresentedViewControllerRecursively;

@end
