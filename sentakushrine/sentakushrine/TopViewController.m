//
//  TopViewController.m
//  sentakushrine
//
//  Created by 東屋 百合絵 on 2015/05/10.
//  Copyright (c) 2015年 東屋　百合絵. All rights reserved.
//

#import "TopViewController.h"

@interface TopViewController ()

@end


@implementation TopViewController
@synthesize startChooseButton = _startChooseButton;
@synthesize optionButton = _optionButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
 選択開始ボタン押下
 
 選択する事柄を選ぶ画面へ遷移する
 */
-(IBAction)onStartChoosebutton:(id)sender{

}


/**
 オプションボタン押下
 
 オプション画面へ遷移する
 */
-(IBAction)onOptionbutton:(id)sender{
    [_optionButton setImage:[UIImage imageNamed:@"option_button_on.png"] forState:UIControlStateNormal];
    
    // 動かない
    OptionViewController *optionVC = [[OptionViewController alloc] init];
    [self.navigationController pushViewController:optionVC animated:YES];
    
}


@end
