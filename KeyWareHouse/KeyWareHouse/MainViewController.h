//
//  MainViewController.h
//  KeyWareHouse
//
//  Created by 東屋 百合絵 on 2015/05/31.
//  Copyright (c) 2015年 TestProject. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MainViewController : UIViewController <UITabBarControllerDelegate>
@property (weak, nonatomic) IBOutlet UITabBar *tabBar;

@property (strong, nonatomic) IBOutlet UIView *wareHouseView;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@property (strong, nonatomic) IBOutlet UIView *settingsView;
@end
