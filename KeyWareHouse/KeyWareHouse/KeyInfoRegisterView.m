//
//  KeyInfoRegisterView.m
//  KeyWareHouse
//
//  Created by 東屋 百合絵 on 2015/06/06.
//  Copyright (c) 2015年 TestProject. All rights reserved.
//

#import "KeyInfoRegisterView.h"

@interface KeyInfoRegisterView ()<UIActionSheetDelegate>{
    NSString * categoryID;
    NSDictionary *categoryNameDic;
    NSDictionary *categoryImageDic;
}
@property (nonatomic, weak) UIView *customView;
@property (nonatomic, strong) UIActionSheet *ac;

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

/*
 ダイアログのデータ初期化メソッド
 */
-(void)initData:(NSString*)id{

    // テストコード：ユーザdefaultの中身を全部表示
    //NSDictionary *mArray = [[NSUserDefaults standardUserDefaults]dictionaryRepresentation];

    // テストコード：テスト用のIDの値を設定
    //ID = @"1000";
    
    
    // カテゴリー名一覧作成
    categoryNameDic = [NSDictionary dictionaryWithObjectsAndKeys:
                   @"Webサイト",@"0",@"SNS",@"1",@"ゲーム",@"2",@"メール",@"3",@"銀行口座",@"4",@"その他",@"5",nil];
    // カテゴリーイメージ一覧作成
    categoryImageDic = [NSDictionary dictionaryWithObjectsAndKeys:    @"category_0.png",@"0",@"category_1.png",@"1",@"category_2.png",@"2",@"category_3.png",@"3",@"category_4.png",@"4",@"category_5.png",@"5",nil];
    ID = id;
    
    UIImage *categoryImage;
    NSString *categoryName;
    // 画面色々初期化（新規登録と更新処理で表示内容を変える）
    if([ID isEqual:@""]){
        // 新規登録の場合
        [self.deleteButton setHidden:YES];  // 削除ボタンを隠す
        [self.closeButton setHidden:NO];    // 閉じるボタンを表示
        
        
        // 鍵のキーを格納しているArrayを呼び出す
        NSMutableArray *mArray = [[NSUserDefaults standardUserDefaults]objectForKey:WAREHOUSE_CODE];
        
        // キーのIDを作成する
        if(mArray.count > 0){
            NSString *value = mArray[(mArray.count-1)];
            ID = [[NSString alloc]initWithFormat:@"%d",value.integerValue + 1];
            //ID = [[NSString alloc]initWithFormat:@"%d",mArray.count + 1000];
        } else {
            ID = @"1000";
        }
        
        
        self.keyName.placeholder = @"何のパス?";
        self.keyId.placeholder = @"ID";
        self.keyPass.placeholder = @"パスワード";
        
        // デフォルトのカテゴリイメージと名前設定
        categoryImage = [UIImage imageNamed:[categoryImageDic objectForKey:@"0"]];
        categoryName = [categoryNameDic objectForKey:@"0"];
        categoryID = @"0";
        
    } else {
        // 更新の場合
        [self.deleteButton setHidden:NO];  // 削除ボタンを表示
        [self.closeButton setHidden:YES];  // 閉じるボタンを隠す
        
        // 渡されたIDの値を呼び出す
        NSMutableArray *array = [[NSUserDefaults standardUserDefaults]objectForKey:ID];
        
        self.keyName.text = array[0];
        self.keyId.text = array[1];
        self.keyPass.text = array[2];
        self.keyNote.text = array[3];
        
        
        categoryImage = [UIImage imageNamed:[categoryImageDic objectForKey:array[4]]];
        categoryName = [categoryNameDic objectForKey:array[4]];
        categoryID = array[4];
        
    }


    // アクションシート設定
    _ac = [[UIActionSheet alloc]initWithTitle:@"カテゴリを選択してください" delegate:self cancelButtonTitle:@"キャンセル" destructiveButtonTitle:nil otherButtonTitles:[categoryNameDic objectForKey:@"0"],[categoryNameDic objectForKey:@"1"],[categoryNameDic objectForKey:@"2"],[categoryNameDic objectForKey:@"3"],[categoryNameDic objectForKey:@"4"],[categoryNameDic objectForKey:@"5"], nil];
    _ac.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    
    // デフォルトのカテゴリを設定する
    _categoryIcon.image = categoryImage;
    
    // ※buttonはUIButtonのオブジェクト
    [_keyCategory setTitle:categoryName forState:UIControlStateNormal];
}

- (IBAction)onDeleteButton:(id)sender {
    // 削除確認ダイアログ表示
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"確認" message:@"削除します。よろしいですか？" delegate:nil cancelButtonTitle:@"いいえ" otherButtonTitles:@"はい", nil];
    alert.delegate = self;
    alert.tag = 2;
    
    // ダイアログ表示
    [alert show];
}

- (IBAction)onCloseButton:(id)sender {
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"確認" message:@"登録せず終了します。よろしいですか？" delegate:nil cancelButtonTitle:@"いいえ" otherButtonTitles:@"はい", nil];
    alert.delegate = self;
    alert.tag = 0;
    
    [alert show];
}

- (IBAction)onUpdateButton:(id)sender {
    UIAlertView *alert;
    
    // 入力チェック
    if([self.keyName.text isEqual:@""]){
        // 入力エラーダイアログ表示
        alert = [[UIAlertView alloc]initWithTitle:@"入力エラー" message:@"鍵の名前が入力されていません" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
    } else if([self.keyId.text isEqual:@""]){
        // 入力エラーダイアログ表示
        alert = [[UIAlertView alloc]initWithTitle:@"入力エラー" message:@"IDが入力されていません" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
    } else if([self.keyPass.text isEqual:@""]){
        // 入力エラーダイアログ表示
        alert = [[UIAlertView alloc]initWithTitle:@"入力エラー" message:@"パスワードが入力されていません" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    }
    
    if(alert ==nil) {
        
        // 登録確認ダイアログ表示
        alert = [[UIAlertView alloc]initWithTitle:@"確認" message:@"登録します。よろしいですか？" delegate:nil cancelButtonTitle:@"いいえ" otherButtonTitles:@"はい", nil];
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
    
    // テストコード：userDefaultの中身を見てみる
    //NSUserDefaults *beforeupdate = [[NSUserDefaults standardUserDefaults] dictionaryRepresentation];
    
    // IDで登録する情報をNSMutableArrayで設定する
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:self.keyName.text];     // 鍵の名前
    [array addObject:self.keyId.text];       // 鍵のID
    [array addObject:self.keyPass.text];    // 鍵のパスワード
    [array addObject:self.keyNote.text];    // 鍵の備考
    [array addObject:categoryID];    // 鍵のカテゴリ
    
    // 登録処理
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:array forKey:ID];
    
    // キーを集約管理している箇所も上書き
    NSMutableArray *masterArray = [ud objectForKey:WAREHOUSE_CODE];
    NSInteger index = [masterArray indexOfObject:ID];
    if(index==NSNotFound){
        [masterArray addObject:ID];
        [ud setObject:masterArray forKey:WAREHOUSE_CODE];
    }
    
    [ud synchronize];
    
    // テストコード：userDefaultの中身を見てみる
    //NSUserDefaults *afterupdate = [[NSUserDefaults standardUserDefaults] dictionaryRepresentation];
    
    
    // この画面を閉じる
    [self closeView];

}

/**
 鍵削除処理
 */
- (void)deleteKeyInfo{
    
    // 削除処理
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    
    // 鍵情報削除
    [ud removeObjectForKey:ID];
    
    // 鍵のキーarrayから当該のキー削除して再度NSDefaultに登録
    NSMutableArray *marray = [ud objectForKey:WAREHOUSE_CODE];
    [marray removeObject:ID];
    [ud setObject:marray forKey:WAREHOUSE_CODE];
    
    [ud synchronize];
    
    // この画面を閉じる
    [self closeView];
    
}

/**
 画面を閉じる処理
 */
- (void)closeView{
    
    // この画面を閉じる
    NSNotification *n = [NSNotification notificationWithName:@"removeModal" object:self];
    [[NSNotificationCenter defaultCenter] postNotification:n];
    
}

/**
 ☓ボタン押下時処理
 */
-(IBAction)onSubCloseButton:(id)sender{

    [self closeView];
}

// カテゴリがタップされたときの処理
-(IBAction)onKeyCategory:(id)sender{

    // カテゴリ選択actionsheetを表示
    [_ac showInView:self];
}

#pragma mark -actionSheetDelegate
-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex{
    UIImage *image;
    NSString *title;
    BOOL isCancel = false;
    switch (buttonIndex) {
        case 0:
            // １番目のボタンが押されたときの処理を記述する
            image = [UIImage imageNamed:[categoryImageDic objectForKey:@"0"]];
            categoryID = @"0";
            title = [categoryNameDic objectForKey:@"0"];
            break;
        case 1:
            // ２番目のボタンが押されたときの処理を記述する
            image = [UIImage imageNamed:[categoryImageDic objectForKey:@"1"]];
            categoryID = @"1";
            title = [categoryNameDic objectForKey:@"1"];
            break;
        case 2:
            // ３番目のボタンが押されたときの処理を記述する
            image = [UIImage imageNamed:[categoryImageDic objectForKey:@"2"]];
            categoryID = @"2";
            title = [categoryNameDic objectForKey:@"2"];
            break;
        case 3:
            // 4番目のボタンが押されたときの処理を記述する
            image = [UIImage imageNamed:[categoryImageDic objectForKey:@"3"]];
            categoryID = @"3";
            title = [categoryNameDic objectForKey:@"3"];
            break;
        case 4:
            // 5番目のボタンが押されたときの処理を記述する
            image = [UIImage imageNamed:[categoryImageDic objectForKey:@"4"]];
            categoryID = @"4";
            title = [categoryNameDic objectForKey:@"4"];
            break;
        case 5:
            // 6番目のボタンが押されたときの処理を記述する
            image = [UIImage imageNamed:[categoryImageDic objectForKey:@"5"]];
            categoryID = @"5";
            title = [categoryNameDic objectForKey:@"5"];
            break;
        default:
            // キャンセルボタン押下時は画像の入れ替えしない
            isCancel = true;
            break;
            
    }
    
    if(!isCancel){
        // 選択したカテゴリの画像を設定する
        _categoryIcon.image = image;
    
        // カテゴリ名をセット
        [_keyCategory setTitle:title forState:UIControlStateNormal];
    }

}
@end
