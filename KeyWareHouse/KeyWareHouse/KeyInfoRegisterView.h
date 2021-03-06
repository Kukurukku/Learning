//
//  KeyInfoRegisterView.h
//  KeyWareHouse
//
//  Created by 東屋 百合絵 on 2015/06/06.
//  Copyright (c) 2015年 TestProject. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KEYClass.h"

@interface KeyInfoRegisterView : UIView
@property NSString *ID;
@property (weak, nonatomic) IBOutlet UITextField *keyName;
@property (weak, nonatomic) IBOutlet UITextField *keyId;

@property (weak, nonatomic) IBOutlet UITextField *keyPass;
@property (weak, nonatomic) IBOutlet UITextView *keyNote;
@property (weak, nonatomic) IBOutlet UIButton *closeButton;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;
@property (weak, nonatomic) IBOutlet UIButton *updateButton;
@property (weak, nonatomic) IBOutlet UIImageView *categoryIcon;
@property (weak, nonatomic) IBOutlet UIButton *keyCategory;

- (IBAction)onKeyCategory:(id)sender;

- (IBAction)onSubCloseButton:(id)sender;

- (IBAction)onDeleteButton:(id)sender;
- (IBAction)onCloseButton:(id)sender;
- (IBAction)onUpdateButton:(id)sender;

-(void)initData:(NSString*)id;
@end
