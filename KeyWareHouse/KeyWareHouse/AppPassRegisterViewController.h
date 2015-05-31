//
//  AppPassRegisterViewController.h
//  KeyWareHouse
//
//  Created by 東屋 百合絵 on 2015/05/31.
//  Copyright (c) 2015年 TestProject. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KEYClass.h"

@interface AppPassRegisterViewController : UIViewController <UITextFieldDelegate,UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *appPassCode;

- (IBAction)onRegisterButton:(id)sender;

//- (void)updatePass;
@end
