//
//  LoginViewController.m
//  KeyWareHouse
//
//  Created by 東屋 百合絵 on 2015/05/31.
//  Copyright (c) 2015年 TestProject. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController()
{

    NSString *appPass;
}

@end

@implementation LoginViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _passText.delegate = self;
    _passText.placeholder = @"パスワード";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{

    // パスワードが登録されているかどうかを確認する
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    appPass = [ud stringForKey:APP_PASS_CODE];
    
    // テストコード：アプリパス登録を呼び出すため
    //appPass = @"";

    // テストコード：パスのキーを格納する領域を削除
    //[ud removeObjectForKey:@"0000"];
    
    // アプリパスワードが登録されていなければ初回と判断し、アプリパス登録画面へ遷移する
    if([appPass isEqual:@""]|| appPass == nil){
        
        // 念のため存在チェック
        if([ud objectForKey:WAREHOUSE_CODE] ==nil){
            // パスワードを呼び出すキーを格納する領域をuserDefaultに作成する。
            NSMutableArray *mArray = [NSMutableArray array];
            [ud setObject:mArray forKey:WAREHOUSE_CODE];
            [ud synchronize];
        }
        
        AppPassRegisterViewController *appPassRegisterViewController = [[AppPassRegisterViewController alloc] init];
        appPassRegisterViewController.modalPresentationStyle = UIModalPresentationOverFullScreen;
        [self presentViewController:appPassRegisterViewController animated:YES completion:nil];
        

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
 ログイン処理
 */
- (IBAction)login:(id)sender {
    
    // 比較用のアプリパスが表示されていない場合対策
    if([appPass isEqual:@""] ||appPass == nil){
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        appPass = [ud stringForKey:APP_PASS_CODE];
    }
    
    // 入力されているパスワードを取得する
    NSString *passCode = _passText.text;
    
    // 入力チェック
    if([passCode  isEqual:@""]){
        
        // 入力がない場合エラー
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"入力エラー" message:@"パスワードを入力してください" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
        
        return;
    }
    
    // 初回に登録したアプリパスと同じであるかどうかチェック
    else if(![passCode isEqual:appPass]){
        // 同じでなければエラーとする
        UIAlertView *differentError = [[UIAlertView alloc]initWithTitle:@"入力エラー" message:@"パスワードが間違っています" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [differentError show];
        return;
    }
    else{
        // メイン画面へ遷移する
        MainViewController *viewController = [MainViewController new];
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
        
        navigationController.modalPresentationStyle = UIModalPresentationOverFullScreen;
        [self presentViewController:navigationController animated:YES completion:nil];

    }
    
}


/**
 Returnボタンタップ時にキーボードを隠す
 */
-(BOOL)textFieldShouldReturn:(UITextField*)textField{

    [_passText resignFirstResponder];
    return YES;
}
@end
