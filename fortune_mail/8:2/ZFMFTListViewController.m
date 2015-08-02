//
//  ZFMFTListViewController.m
//  fortunemailapp
//
//  Created by 東屋 百合絵 on 2015/08/02.
//  Copyright (c) 2015年 Zappallas. All rights reserved.
//

#import "ZFMFTListViewController.h"
#import "ZFMFTViewModel.h"
#import "ZFMFTListCell.h"

@interface ZFMFTListViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(weak,nonatomic)IBOutlet UICollectionView *collectionView;
@property(strong,nonatomic)ZFMFTViewModel *model;
@end

@implementation ZFMFTListViewController

- (void)dealloc {
    self.model = nil;
}

#pragma mark Designated Initializer
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // write your initialize code.
        self.model = [[ZFMFTViewModel alloc] init];
        DLog(@"ログの出力はDLogで行います。");
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.collectionView.delegate = self;
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // KVOを開始する
    [self startObserving];
    
    // 占い師一覧を取得する
    [self.model getFortuneTellerList];
    
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    // KVOを終了する
    [self stopObserving];
}

#pragma mark KVO
- (void)startObserving {
    // 占い師詳細情報が登録できたかどうかの状態値の変更を監視し、値に変更があれば処理を呼び出す。
    [self.model addObserver:self forKeyPath:@"isListUpdate" options:NSKeyValueObservingOptionNew context:@selector(setUserList)];
}

- (void)stopObserving {
    [self.model removeObserver:self forKeyPath:@"isListUpdate" context:@selector(setUserList)];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    [self performSelectorOnMainThread:(SEL)context withObject:change waitUntilDone:YES];
}
-(void)setUserList{

    [self.collectionView reloadData];
}
#pragma mark -


#pragma mark - UICollectionViewDelegate
/**
 セクション数を返す
 
 */
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return 1;
}

/**
 セクションごとの、データ数を返す。
 ここでは、ZFMFTViewModelで取得した占い師一覧(userList)数を設定
 
 */
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return self.model.userList.count;

}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    ZFMFTListCell *cell;
    
    if(indexPath.section == 0){
    
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZFMFTListCell" forIndexPath:indexPath];
        [cell setFortuneTellerInfo:[self.model.userList objectAtIndex:indexPath.row]];
        
    }
    return cell;
}

#pragma mark -

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
