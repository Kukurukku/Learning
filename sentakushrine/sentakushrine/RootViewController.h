//
//  RootViewController.h
//  sentakushrine
//
//  Created by 東屋　百合絵 on 2015/04/14.
//  Copyright (c) 2015年 東屋　百合絵. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "HistoryListViewController.h"
#import "HistoryDetailsViewController.h"

@interface RootViewController : UIViewController

@property(strong,nonatomic)IBOutlet UIButton *sentakuButton;
- (IBAction)onSentakuButton:(id)sender;
- (IBAction)onHistoryButton:(id)sender;
- (IBAction)onSettingButton:(id)sender;
@end

