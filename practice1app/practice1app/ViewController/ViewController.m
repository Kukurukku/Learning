//
//  ViewController.m
//  practice1app
//
//  Created by 東屋　百合絵 on 2015/06/29.
//  Copyright (c) 2015年 東屋　百合絵. All rights reserved.
//

// pod library
#import "XYPieChart.h"

// Header
#import "ViewController.h"

// ViewModel
#import "ViewModel.h"

#import "AFNetWorking.h"/* ★★fortunemail用★★ */
#import <CoreLocation/CoreLocation.h>

#import "ConnectionAPI.h"/* ★★fortunemail用★★ */

@interface ViewController ()<XYPieChartDataSource,XYPieChartDelegate,UITextFieldDelegate>/* ★★fortunemail用★★ */

@property(nonatomic, strong)ViewModel *model;

@property(nonatomic, weak)IBOutlet UILabel *label;

@property (weak, nonatomic) IBOutlet UITextField *dateTextField;
// 各スライスの色
@property(nonatomic, strong) XYPieChart *chart;
// 各スライスの色
@property(nonatomic, strong) NSArray *sliceColors;
// 各スライスのデータ
@property(nonatomic, strong) NSMutableArray *slices;


@end

@implementation ViewController

#pragma mark Dealloc
- (void)dealloc {
    self.model = nil;
}
#pragma mark -

#pragma mark Designated Initializer
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // write your initialize code.
        self.model = [[ViewModel alloc] init];
        DLog(@"ログの出力はDLogで行います。");
    }
    return self;
}
#pragma mark -

#pragma mark Convenience Initializer
+ (ViewController *)viewController {
    NSString *nibName = NSStringFromClass([self class]);
    return [[ViewController alloc] initWithNibName:nibName bundle:[NSBundle mainBundle]];
}
#pragma mark -

#pragma mark Class Methods
#pragma mark -

#pragma mark Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /* ★★fortunemail用★★ */
    // 日付のボックスに日付だけしか入らないようにする
    _dateTextField.keyboardType = UIKeyboardTypeNumberPad;
    [_dateTextField setDelegate:self];
    
    /* ★★fortunemail用★★ */
    // 日付の数値キーボードをとじるため、gestureを追加
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeKeyBoard:)];
    [self.view addGestureRecognizer:gesture];
    
    // スライスに表示するデータの定義
    self.slices = [NSMutableArray arrayWithCapacity:5];
    
    for (int i = 0; i < 5; i ++) {
        NSNumber *one = [NSNumber numberWithInt:rand() % 60 + 20];
        [self.slices addObject:one];
    }
    
    // 各項目の背景色を定義
    self.sliceColors = @[[UIColor colorWithRed:246/255.0 green:155/255.0 blue:0/255.0 alpha:1],
                         [UIColor colorWithRed:129/255.0 green:195/255.0 blue:29/255.0 alpha:1],
                         [UIColor colorWithRed:62/255.0 green:173/255.0 blue:219/255.0 alpha:1],
                         [UIColor colorWithRed:229/255.0 green:66/255.0 blue:115/255.0 alpha:1],
                         [UIColor colorWithRed:148/255.0 green:141/255.0 blue:139/255.0 alpha:1]];
    
    // パイチャートの初期化
    self.chart = [[XYPieChart alloc] initWithFrame:CGRectMake(10, 10, 220.0, 220.0)];
    
    // デリゲートの設定
    self.chart.delegate = self;
    // データソースの設定
    self.chart.dataSource = self;
    // パイチャートの中心位置
    self.chart.pieCenter = CGPointMake(self.view.centerX, 150);
    // YESの場合、パーセンテージで数字を表示します。
    self.chart.showPercentage = NO;
    // 値を表示するラベルのフォント
    self.chart.labelFont = [UIFont systemFontOfSize:12.0];
    // 値を表示するラベルの色
    self.chart.labelColor = [UIColor blackColor];
    // 値を表示するラベル背景のシャドウカラー
    self.chart.labelShadowColor = [UIColor darkGrayColor];
    // 表示アニメーションのスピード
    self.chart.animationSpeed = 1.0;
    // パイチャートの背景色
    [self.chart setPieBackgroundColor:[UIColor darkGrayColor]];
    
    [self.view addSubview:self.chart];
    
    // パイチャートを描画します。
    [self.chart reloadData];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // ViewModelの値の監視を始める
    [self startObserving];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];

    // ViewModelの値の監視を終了
    [self stopObserving];
}

#pragma mark -

#pragma mark KVO
- (void)startObserving {
    [self.model addObserver:self forKeyPath:@"count" options:NSKeyValueObservingOptionNew context:@selector(countUpdated:)];

    // 初回呼び出し
    [self countUpdated:nil];
}

- (void)stopObserving {
    [self.model removeObserver:self forKeyPath:@"count" context:@selector(countUpdated:)];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    [self performSelectorOnMainThread:(SEL)context withObject:change waitUntilDone:YES];
}

- (void)countUpdated:(NSDictionary *)change {
    // ViewModelのプロパティcountの値が変わったらラベルに表示する
    [self.label setText:[NSString stringWithFormat:@"%d",(int)self.model.count]];
}

#pragma mark -

#pragma mark Memory Management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -

#pragma mark Public Methods
#pragma mark -

#pragma mark Private Methods
#pragma mark -

#pragma mark Delegate
#pragma mark -

#pragma mark Action
- (IBAction)tappedButton:(id)sender {
    [self.model increaseCount];
    
    self.slices = [NSMutableArray arrayWithCapacity:3];
    
    for (int i = 0; i < 5; i ++) {
        NSNumber *one = [NSNumber numberWithInt:rand() % 60 + 20];
        [self.slices addObject:one];
    }
    
    
    // パイチャートを描画します。
    [self.chart reloadData];
}
#pragma mark -


#pragma mark - XYPieChart Data Source

// スライスの件数
- (NSUInteger)numberOfSlicesInPieChart:(XYPieChart *)pieChart
{
    return self.slices.count;
}

// 各スライスの値
- (CGFloat)pieChart:(XYPieChart *)pieChart valueForSliceAtIndex:(NSUInteger)index
{
    return [self.slices[index] floatValue];
}

// 各スライスの色を設定(Optional)
- (UIColor *)pieChart:(XYPieChart *)pieChart colorForSliceAtIndex:(NSUInteger)index
{
    return self.sliceColors[(index % self.sliceColors.count)];
}

// 各スライスに表示する文字列の設定(Optional)
- (NSString *)pieChart:(XYPieChart *)pieChart textForSliceAtIndex:(NSUInteger)index
{
    return [NSString stringWithFormat:@"%@ 件", self.slices[index]];
}

/* ★★fortunemail用★★ */
/**
 afnetworkingのテスト用
 */
- (IBAction)connectionAPIButton:(id)sender {
    
    // OpenWeatherMapの天気出力APIエンドポイント
    /*NSString *kOpenWeatherMap3HoursForecastAPI = @"http://api.openweathermap.org/data/2.5/weather?units=metric&lat=%f&lon=%f";
    
    // 適当な緯度経度
    CLLocationDegrees lat = 39.01;
    CLLocationDegrees log = 141.68;
    
    NSString *urlString = [NSString stringWithFormat:kOpenWeatherMap3HoursForecastAPI, lat, log];
    
    [[AFHTTPRequestOperationManager manager] GET:urlString
                                      parameters:nil
                                         success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                             NSLog(@"JSON: %@", responseObject);
                                         }
                                         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                             NSLog(@"Error: %@", error);
                                         }];
    */
    
    /*
     ここから下はAFNetworkingのサンプルになります。
     概要としては、適当な緯度経度を渡して、その場所のお天気情報を取得するもの。
     
     ConnectionAPIはAFHttpSessionManagerを継承したメソッドで、getWeatherメソッドに、経度緯度を渡すと取得されてくる。
     */
    
    
    NSString *latitude = @"39.01";
    NSString *longitude = @"141.68";
    
    NSDictionary *dic = @{@"latitude":latitude,@"longitude":longitude};
    
    ConnectionAPI *manager = [ConnectionAPI sharedManager];
    [manager getWeather:dic completion:^(NSDictionary *results ,NSError *error){
        if(error != nil) {
            
            // エラー処理
            NSLog(@"エラーですORZ");
            return;
        } else {
            
            if(results.count != 0){
                // 成功時処理
                NSLog(@"取得成功！");
                NSLog(@"%@",results);
            } else {
                //失敗処理
                NSLog(@"取得失敗・・・");
            }
            /*if([results[@"sucess"] isEqual:@(YES)]){
                // 成功時処理
                NSLog(@"取得成功！");
            } else {
                //失敗処理
                NSLog(@"取得失敗・・・");
            }*/
        }
        
        
        
    }];
    
}
/* ★★fortunemail用★★ */
/**
 日付キーボードの閉じる処理
 */
-(void)closeKeyBoard:(id)sender{
    
    [self.view endEditing:YES];
    //[_dateTextField resignFirstResponder];
    
}
/* ★★fortunemail用★★ */
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
		
