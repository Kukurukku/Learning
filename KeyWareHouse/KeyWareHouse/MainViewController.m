//
//  MainViewController.m
//  KeyWareHouse
//
//  Created by 東屋 百合絵 on 2015/05/31.
//  Copyright (c) 2015年 TestProject. All rights reserved.
//

#import "MainViewController.h"
#import "CustomBaseView.h"
#import "WareHouseCollectionViewCell.h"
#import "RegisterKeyView.h"
#import "KeyInfoRegisterView.h"

@interface MainViewController () <UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITabBarControllerDelegate>
@property NSArray *views;
@property NSMutableDictionary *list;
@property (strong,nonatomic) IBOutlet UIView* modalBg;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 通知作成
    NSNotificationCenter *nc  =[NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(removeModalview) name:@"removeModal" object:nil];
    
    self.collectionView.delegate = self;
    
    // 鍵リストを初期化
    self.list = [NSMutableDictionary dictionary];
    
    // 鍵のデータを取得する
    NSUserDefaults *ud =[NSUserDefaults standardUserDefaults];
    NSMutableArray *masterArray = [ud objectForKey:WAREHOUSE_CODE];
    
    [masterArray enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL *stop) {
        
        NSString *index = [NSString stringWithFormat:@"%d",idx];
        NSMutableArray *array = [NSMutableArray array];
        [array addObject:obj]; //鍵ID
        [array addObject:[ud objectForKey:obj][0]]; //鍵名
        [array addObject:[ud objectForKey:obj][1]]; //仮に鍵のログインID(色々整ったら鍵種別に差し替える)

        NSString *ag1= [ud objectForKey:obj][2];
        NSString *ag2= [ud objectForKey:obj][3];


        
        [self.list setObject:array forKey:index];

    }];
    
    // Do any additional setup after loading the view from its nib.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.title = @"パスワード金庫";
    // 新規追加ボタンをnavigationbarに設ける
    UIBarButtonItem *addKeyButton = [[UIBarButtonItem alloc] initWithTitle:@"登録" style:UIBarButtonItemStylePlain target:self action:@selector(onAddKeyButton:)];
    self.navigationItem.rightBarButtonItem = addKeyButton;
    

    // タブのタグはxibで付与する
    
    // タブをcontentviewに登録する
    self.views = [NSArray arrayWithObjects:self.wareHouseView,self.settingsView, nil];
    [self.tabBarController setViewControllers:self.views animated:NO];
    
    
    
    for ( CustomBaseView *view in self.views) {
        
        view.mainviewController = self;
        view.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:view];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                                     attribute:NSLayoutAttributeBottom
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.contentView
                                                                     attribute:NSLayoutAttributeBottom
                                                                    multiplier:1
                                                                      constant:0]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                                     attribute:NSLayoutAttributeTop
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.contentView
                                                                     attribute:NSLayoutAttributeTop
                                                                    multiplier:1
                                                                      constant:0]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                                     attribute:NSLayoutAttributeLeading
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.contentView
                                                                     attribute:NSLayoutAttributeLeading
                                                                    multiplier:1
                                                                      constant:0]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                                     attribute:NSLayoutAttributeTrailing
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:self.contentView
                                                                     attribute:NSLayoutAttributeTrailing
                                                                    multiplier:1
                                                                      constant:0]];
    }

    
    [self selectView:0];
    
    [self.collectionView setBackgroundColor:[UIColor lightGrayColor]];
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([WareHouseCollectionViewCell class]) bundle:nil]
          forCellWithReuseIdentifier:@"item"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
 鍵追加ボタン押下時処理
 */
-(void)onAddKeyButton:(id)sender{
    
    [self showModalView:@""];
}

#pragma mark -TabDelegate
-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    NSInteger selectedItem = (long)item.tag;
    [self selectView:selectedItem];
}

-(void)selectView:(long)index {
    
    for (int i = 0; i < self.views.count; i++) {
        if (index == i) {
            [[self.views objectAtIndex:i] setHidden:NO];
        }
        else {
            [[self.views objectAtIndex:i] setHidden:YES];
        }
    }


}
#pragma mark -collectionViewDelegate
/**
 アイテム数返却
 */
- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section
{
    return self.list.count;
}

/**
 セルを返す
 */
- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    WareHouseCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"item" forIndexPath:indexPath];
    NSString *index = [NSString stringWithFormat:@"%d",indexPath.item];

    // 鍵の名前とアイコン（TODO）を設定
    [cell setKeyInfo:@"0" keyTexttitle:[self.list objectForKey:index][1]];
    
    // 色々整えたら、鍵種別によってアイコンをかえる処理を入れる
    
    return cell;
}

/**
 セルが選択されたときに呼ばれる
 */
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    // 登録更新が面に渡す鍵自体のIDを算出
    NSString *index = [NSString stringWithFormat:@"%d",indexPath.item];
    NSString *ID = [self.list objectForKey:index][0];
    
    [self showModalView:ID];
    
    
    // テストコード
    //NSLog([NSString stringWithFormat:@"鍵IDは%@",ID]);
    // モーダルで出すやりかた
    /*RegisterKeyView *registerKeyView = [[RegisterKeyView alloc] init];
    registerKeyView.modalPresentationStyle = UIModalPresentationCustom;
    // 新規登録なのでIDを空白で渡す
    registerKeyView.ID = ID;
    [self presentViewController:registerKeyView animated:YES completion:nil];*/
}

/**
 モーダルを閉じる処理
 
 */
-(void)removeModalview{
    
    [UIView animateWithDuration:0.3f delay:0.0f options:UIViewAnimationOptionAllowAnimatedContent animations:^ {
        //アニメーションで変化させたい値を設定する（最終的に変更したい値）
        
        // モーダルの背景をフェードアウト
        [_modalBg setAlpha:0];
        // モーダルの内容frameを縮小
        UIView *v = _modalBg.subviews[0];
        v.transform = CGAffineTransformMakeScale(0.1,0.1);
        //v.frame = CGRectMake(160, 284, 0, 0);
        
    } completion:^(BOOL finished) {
        //完了時のコールバック
        [_modalBg removeFromSuperview];
    }];
    
    [self refreshData];
}

/**
 モーダルビューを出す
 */
-(void)showModalView:(NSString*)ID{

    //モーダル背景の生成
    _modalBg =[[UIView alloc] initWithFrame:CGRectMake(0,0,320,720)];
    _modalBg.backgroundColor =  [UIColor colorWithWhite:0 alpha:0.3];
    
    [self.view addSubview:_modalBg];
    
    // モーダルウインドウの生成
    KeyInfoRegisterView *keyInfoView =[[KeyInfoRegisterView alloc] initWithFrame:CGRectMake(24,40,272,400)];
    keyInfoView.transform = CGAffineTransformMakeScale(0.5,0.5);
    [keyInfoView initData:ID];
    keyInfoView.layer.cornerRadius = 5;
    keyInfoView.clipsToBounds = true;
    keyInfoView.backgroundColor =  [UIColor colorWithWhite:1 alpha:1];
    
    
    [keyInfoView setAlpha:0.0];
    keyInfoView.backgroundColor = [UIColor colorWithWhite:0 alpha:1];
    
    
    // UIView animationaWithDurationのテストコード（うまくいかない）
    /*[UIView animateWithDuration:5.0f delay:0.0f options:UIViewAnimationOptionCurveEaseIn animations:^{
        keyInfoView.transform = CGAffineTransformMakeScale(1.0,1.0);
        [keyInfoView setAlpha:1];
        
        keyInfoView.backgroundColor = [UIColor colorWithWhite:1 alpha:1];
    
    } completion:^(BOOL finished){
        [_modalBg addSubview:keyInfoView];
    }];*/
    
    
    
    
    // アニメーション
    [UIView beginAnimations:nil context:NULL];
    // 秒数設定
    [UIView setAnimationDuration:0.3];
    
    keyInfoView.transform = CGAffineTransformMakeScale(1.0,1.0);
    [keyInfoView setAlpha:1];
    
    keyInfoView.backgroundColor = [UIColor colorWithWhite:1 alpha:1];
    [_modalBg addSubview:keyInfoView];
    [UIView commitAnimations];

}

/**
 鍵情報を更新する
 */
-(void)refreshData{

    // 鍵情報が入ったlistを削除する
    [self.list removeAllObjects];
    
    // 鍵のデータを取得する
    NSUserDefaults *ud =[NSUserDefaults standardUserDefaults];
    NSMutableArray *masterArray = [ud objectForKey:WAREHOUSE_CODE];
    
    [masterArray enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL *stop) {
        
        NSString *index = [NSString stringWithFormat:@"%d",idx];
        NSMutableArray *array = [NSMutableArray array];
        [array addObject:obj]; //鍵ID
        [array addObject:[ud objectForKey:obj][0]]; //鍵名
        [array addObject:[ud objectForKey:obj][1]]; //仮に鍵のログインID(色々整ったら鍵種別に差し替える)
        
        [self.list setObject:array forKey:index];
        
    }];
    
    // reloadDataでcollectionviewのcellforItemAtIndexPathが呼ばれる
    [self.collectionView reloadData];
}
@end
