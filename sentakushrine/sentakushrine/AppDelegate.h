//
//  AppDelegate.h
//  sentakushrine
//
//  Created by 東屋　百合絵 on 2015/04/14.
//  Copyright (c) 2015年 東屋　百合絵. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopViewController.h"
#import "RootViewController.h"
#import "HistoryListViewController.h"

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) TopViewController *topViewController;

@property (strong, nonatomic) RootViewController *rootViewController;

@property (strong, nonatomic) HistoryListViewController *historyListViewController;




@property (strong, nonatomic) ViewController *viewController;

@property (strong, nonatomic) UINavigationController *navigationController;
@end

