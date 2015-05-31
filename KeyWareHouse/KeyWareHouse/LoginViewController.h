//
//  LoginViewController.h
//  KeyWareHouse
//
//  Created by 東屋 百合絵 on 2015/05/31.
//  Copyright (c) 2015年 TestProject. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KEYClass.h"
#import "AppPassRegisterViewController.h"

@interface LoginViewController : UIViewController <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *passText;


- (IBAction)login:(id)sender;

@end
