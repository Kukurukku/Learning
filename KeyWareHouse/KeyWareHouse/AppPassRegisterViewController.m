//
//  AppPassRegisterViewController.m
//  KeyWareHouse
//
//  Created by 東屋 百合絵 on 2015/05/31.
//  Copyright (c) 2015年 TestProject. All rights reserved.
//

#import "AppPassRegisterViewController.h"

@interface AppPassRegisterViewController ()

@end

@implementation AppPassRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _appPassCode.delegate = self;
    _appPassCode.placeholder = @"アプリ用パスワード";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{

    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSString *pass = [ud stringForKey:APP_PASS_CODE];
    
    // テストコード初回表示時再現
    if([pass isEqual:@""] || pass == nil){
        // 入力がない場合エラー
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"ようこそパス金庫へ！" message:@"まずはアプリにログインするパスワードを登録しましょう" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

/**
 パスワード登録ボタン押下時処理
 */
- (IBAction)onRegisterButton:(id)sender {
    
    // 入力されているパスワードを取得する
    NSString *passCode = _appPassCode.text;
    
    // 入力チェック
    if([passCode  isEqual:@""]){
        
        // 入力がない場合エラー
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"入力エラー" message:@"パスワードを入力してください" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
        
        return;
    }
    
    
    // パスワード確認ダイアログ
    UIAlertView * confirm = [[UIAlertView alloc]initWithTitle:@"登録確認" message:@"このパスワードを登録します、よろしいですか" delegate:nil cancelButtonTitle:@"修正" otherButtonTitles:@"登録する", nil];
    confirm.delegate = self;
    
    [confirm show];
    

}
/**
 Returnボタンタップ時にキーボードを隠す
 */
-(BOOL)textFieldShouldReturn:(UITextField*)textField{
    
    [_appPassCode resignFirstResponder];
    return YES;
}

/**
 登録確認ダイアログのデリゲート
 */
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{

    
    switch (buttonIndex) {
        
        // 修正ボタンが押下
        case 0:
        [self updatePass];
            return;
        break;
        
        // 登録ボタンが押下
        default:
            // パスワード登録処理
            [self updatePass];
        
        
        break;
    }
}

/**
 パスワード登録処理
 */
-(void)updatePass{

    //アプリパスワードを登録する
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:_appPassCode.text forKey:APP_PASS_CODE];
    [ud synchronize];
    
    // この画面を閉じる
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
