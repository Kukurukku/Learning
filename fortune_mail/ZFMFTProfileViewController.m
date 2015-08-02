//
//  ZFMFTProfileViewController.m
//  fortunemailapp
//
//  Created by 東屋　百合絵 on 2015/07/31.
//  Copyright (c) 2015年 Zappallas. All rights reserved.
//

#import "ZFMFTProfileViewController.h"
#import "ZFMFTViewModel.h"

@interface ZFMFTProfileViewController ()

// TODO ストーリーボードと接続する
//mod8/2 UITextView▶︎UILabel
@property(nonatomic,weak)IBOutlet UILabel *ftName;
@property(nonatomic,weak)IBOutlet UIImageView *ftImageView;
@property(nonatomic,weak)IBOutlet UILabel *ftSpCategory;
@property(nonatomic,weak)IBOutlet UILabel *ftDivination;
@property(nonatomic,weak)IBOutlet UILabel *ftEvaluation;
@property(nonatomic,weak)IBOutlet UILabel *ftShortMessage;
@property(nonatomic,weak)IBOutlet UILabel *ftSchedule;



@property(nonatomic, strong)ZFMFTViewModel *model;
//mod8/2 プロパティをheaderファイルに移動
//@property(nonatomic, strong)NSString *ftID;
@end

@implementation ZFMFTProfileViewController

- (void)dealloc {
    self.model = nil;
}

#pragma mark Designated Initializer
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // write your initialize code.
        self.model = [[ZFMFTViewModel alloc] init];
        
        // IDを収得
        // mod8/2 仮の占い師IDをテスト用に設定する
        self.ftID = @"1234";
        DLog(@"ログの出力はDLogで行います。");
    }
    return self;
}

#pragma mark -
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // KVOを開始する
    [self startObserving];
    
    // 占い師詳細情報を取得
    [self.model getFortuneTellerInfo:self.ftID];
    
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    // KVOを終了する
    [self stopObserving];
}
#pragma mark KVO
- (void)startObserving {
    // 占い師詳細情報が登録できたかどうかの状態値の変更を監視し、値に変更があれば処理を呼び出す。
    [self.model addObserver:self forKeyPath:@"isSuccessGetInfo" options:NSKeyValueObservingOptionNew context:@selector(setupFTProfileView)];
}

- (void)stopObserving {
    [self.model removeObserver:self forKeyPath:@"isSuccessGetInfo" context:@selector(setupFTProfileView)];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    [self performSelectorOnMainThread:(SEL)context withObject:change waitUntilDone:YES];
}
#pragma mark -

/**
 占い師情報を画面要素に設定する。
 
 */
-(void)setupFTProfileView {
    if(self.model.isSuccessGetInfo) {
        // 名前を設定
        self.ftName.text = self.model.fortuneTellerName;
        
        // 画像を設定
        [self.ftImageView setImage:self.model.fortuneTellerImage];
        
        // カテゴリを設定
        self.ftSpCategory.text = self.model.spCategory;
        
        // 占術を設定
        self.ftDivination.text = self.model.divination;
        
        // 評価を設定
        self.ftEvaluation.text = self.model.evaluation;
        
        // ひとことを設定
        self.ftShortMessage.text = self.model.shortMessage;
        
        // お休み状況を設定
        self.ftSchedule.text = self.model.schedule;
        
        // 商品ボタンを設定 TODO 使用決まってないため
    } else {
        // アラート表示
        [self showAlertWithTitle:LocalizableStringForKey(@"alert_title_error")  message:LocalizableStringForKey(@"alert_message_get_ft_info_failed")  cancelButtonTitle:LocalizableStringForKey(@"alert_dialog_ok")   cancelButtonAction:^{
            
            // TODO 失敗アラートでOKがおされたら当画面を閉じて、遷移元を表示する
            //[self dismissViewControllerAnimated:YES completion:nil];
            DLog(@"占い師情報取得失敗");
            
        }
               otherButtonTitles:nil otherButtonActions:nil];
    }
}

@end
