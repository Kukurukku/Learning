//
//  RootViewController.m
//  sentakushrine
//
//  Created by 東屋　百合絵 on 2015/04/14.
//  Copyright (c) 2015年 東屋　百合絵. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 選択ボタンが押下されたら
- (IBAction)onSentakuButton:(id)sender{

}

// 履歴ボタンがおされたら
- (IBAction)onHistoryButton:(id)sender{
    // 4/20 落ちないが何もおきない
    HistoryListViewController *viewController = [[HistoryListViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
    
    /*// 4/14おちる
    BaseViewController *viewController = [[BaseViewController alloc]init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
     

    //controller　＠の中はIdentifierで定義した名前
    HistoryDetailsViewController *sub = [[HistoryDetailsViewController alloc]init];
    
    //NavigationControllerを使って遷移する
    //[self.navigationController pushViewController:sub animated:YES];*/
}

// 設定ボタンがおされたら
- (IBAction)onSettingButton:(id)sender{
    
}
@end
