//
//  TopViewController.h
//  sentakushrine
//
//  Created by 東屋 百合絵 on 2015/05/10.
//  Copyright (c) 2015年 東屋　百合絵. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OptionViewController.h"

@interface TopViewController : UIViewController

@property (nonatomic,strong) IBOutlet UIButton *startChooseButton;
@property (nonatomic,strong) IBOutlet UIButton *optionButton;

-(IBAction)onStartChoosebutton:(id)sender;
-(IBAction)onOptionbutton:(id)sender;
@end
