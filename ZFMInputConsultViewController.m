//
//  ZFMInputConsultViewController.m
//  fortunemailapp
//
//  Created by 東屋　百合絵 on 2015/08/07.
//  Copyright (c) 2015年 Zappallas. All rights reserved.
//

#import "ZFMInputConsultViewController.h"

@interface ZFMInputConsultViewController ()<UIActionSheetDelegate>
@property (nonatomic, strong) UIActionSheet *ac;
@property (nonatomic, strong) NSMutableArray *categoryList;
@end

@implementation ZFMInputConsultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
 ダイアログのデータ初期化メソッド
 */
-(void)initData:(NSString*)id{
    
    // カテゴリー名一覧取得
    _categoryList = [NSDictionary dictionaryWithObjectsAndKeys:
                       @"Webサイト",@"0",@"SNS",@"1",@"ゲーム",@"2",@"メール",@"3",@"銀行口座",@"4",@"その他",@"5",nil];

    
    // アクションシート設定
    _ac = [[UIActionSheet alloc]initWithTitle:@"カテゴリを選択してください" delegate:self cancelButtonTitle:@"キャンセル" destructiveButtonTitle:nil otherButtonTitles:@"恋愛",@"結婚",@"仕事",@"健康",@"誰にも言えない",@"その他", nil];
    _ac.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
 
}
#pragma mark -actionSheetDelegate
-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex{
    UIImage *image;
    NSString *title;
    BOOL isCancel = false;
    /*switch (buttonIndex) {
        case 0:
            // １番目のボタンが押されたときの処理を記述する
            categoryID = @"0";
            title = [categoryNameDic objectForKey:@"0"];
            break;
        case 1:
            // ２番目のボタンが押されたときの処理を記述する
            categoryID = @"1";
            title = [categoryNameDic objectForKey:@"1"];
            break;
        case 2:
            // ３番目のボタンが押されたときの処理を記述する
            categoryID = @"2";
            title = [categoryNameDic objectForKey:@"2"];
            break;
        case 3:
            // 4番目のボタンが押されたときの処理を記述する
            categoryID = @"3";
            title = [categoryNameDic objectForKey:@"3"];
            break;
        case 4:
            // 5番目のボタンが押されたときの処理を記述する
            categoryID = @"4";
            title = [categoryNameDic objectForKey:@"4"];
            break;
        case 5:
            // 6番目のボタンが押されたときの処理を記述する
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
    }*/
    
}

@end
