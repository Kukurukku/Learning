//
//  RegisterKeyViewController.h
//  KeyWareHouse
//
//  Created by 東屋 百合絵 on 2015/06/06.
//  Copyright (c) 2015年 TestProject. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KEYClass.h"

@interface RegisterKeyView : UIViewController
{
    // 前の画面から渡される鍵ID
    NSString *ID;
}

@property NSString *ID;
@property (weak, nonatomic) IBOutlet UITextField *keyName;
@property (weak, nonatomic) IBOutlet UITextField *keyID;
@property (weak, nonatomic) IBOutlet UITextField *passWord;
@property (weak, nonatomic) IBOutlet UITextView *note;
@property (weak, nonatomic) IBOutlet UIButton *updateButton;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;
@property (weak, nonatomic) IBOutlet UIButton *closeButton;



- (IBAction)onUpdateButton:(id)sender;
- (IBAction)onDeleteButton:(id)sender;
- (IBAction)onCloseButton:(id)sender;
@end
