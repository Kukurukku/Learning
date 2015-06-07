//
//  KeyInfoRegisterView.m
//  KeyWareHouse
//
//  Created by 東屋 百合絵 on 2015/06/06.
//  Copyright (c) 2015年 TestProject. All rights reserved.
//

#import "KeyInfoRegisterView.h"

@interface KeyInfoRegisterView ()
@property (nonatomic, weak) UIView *customView;

@end

@implementation KeyInfoRegisterView
@synthesize ID;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initWithNib];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initWithNib];
    }
    return self;
}

- (void)initWithNib {
    self.customView = [[[NSBundle mainBundle] loadNibNamed:@"KeyInfoRegisterView"
                                                     owner:self
                                                   options:nil] objectAtIndex:0];
    [self addSubview:self.customView];
}

-(void)layoutSubviews {
    self.customView.frame = self.bounds;
}

- (IBAction)onDeleteButton:(id)sender {
    // 削除確認ダイアログ表示
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"確認" message:@"削除します。よろしいですか？" delegate:nil cancelButtonTitle:@"キャンセル" otherButtonTitles:nil, nil];
    alert.delegate = self;
    alert.tag = 2;
}

- (IBAction)onCloseButton:(id)sender {
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"確認" message:@"登録せずに終了します。よろしいですか？" delegate:nil cancelButtonTitle:@"キャンセル" otherButtonTitles:nil, nil];
    alert.delegate = self;
    alert.tag = 0;
}

- (IBAction)onUpdateButton:(id)sender {
    UIAlertView *alert;
    // 入力チェック
    if([self.keyName isEqual:@""]){
        // 入力エラーダイアログ表示
        alert = [[UIAlertView alloc]initWithTitle:@"入力エラー" message:@"鍵の名前が入力されていません" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil];
        return;
        
    } else if([self.keyId isEqual:@""]){
        // 入力エラーダイアログ表示
        alert = [[UIAlertView alloc]initWithTitle:@"入力エラー" message:@"IDが入力されていません" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil];
        
    } else if([self.keyPass isEqual:@""]){
        // 入力エラーダイアログ表示
        alert = [[UIAlertView alloc]initWithTitle:@"入力エラー" message:@"パスワードが入力されていません" delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil];
    }
    
    if(alert ==nil) {
        
        // 登録確認ダイアログ表示
        alert = [[UIAlertView alloc]initWithTitle:@"確認" message:@"登録します。よろしいですか？" delegate:nil cancelButtonTitle:@"キャンセル" otherButtonTitles:nil, nil];
        alert.delegate = self;
        alert.tag = 1;
    }
    
    // ダイアログ表示
    [alert show];

}

/**
 確認ダイアログのデリゲート
 */
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    // 更新確認ダイアログ表示時
    if(alertView.tag ==1){
        switch (buttonIndex) {
                
                // キャンセルボタンが押下
            case 0:
                return;
                break;
            default:
                // 更新ボタンが押下時、更新処理実施
                [self updateKeyInfo];
                break;
        }
        
    } else if(alertView.tag ==2){
        // 削除確認ダイアログ表示時
        switch (buttonIndex) {
                
                // キャンセルボタンが押下
            case 0:
                return;
                break;
            default:
                // 削除ボタンが押下時、削除処理実施
                [self deleteKeyInfo];
                break;
        }
        
    } else {
        
        // 閉じる確認ダイアログ表示時
        switch (buttonIndex) {
            case 0:
                // 処理を行わない
                return;
                break;
            default:
                // この画面を閉じる
                [self closeView];
                break;
        }
        
    }
}

/**
 鍵登録更新処理
 */
- (void)updateKeyInfo{
    
    // 登録処理
    // idがあったら更新処理、なければ登録処理
    
    // この画面を閉じる
    [self closeView];
}

/**
 鍵削除処理
 */
- (void)deleteKeyInfo{
    
    // 削除処理
    
    // この画面を閉じる
    [self closeView];
    
}

/**
 画面を閉じる処理
 */
- (void)closeView{
    
    // この画面を閉じる
    
}

@end
