//
//  CustomNavigationController.m
//  UIViewControllerTEST
//
//  Created by 東屋　百合絵 on 2015/04/09.
//  Copyright (c) 2015年 東屋　百合絵. All rights reserved.
//

#import "CustomNavigationController.h"

@interface CustomNavigationController ()

@end

@implementation CustomNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    CGRect navigationBarFrame = self.navigationBar.frame;
    
    navigationBarFrame.size.height = 100.0f;
    self.navigationBar.frame = navigationBarFrame;
    self.navigationBar.backgroundColor = [UIColor redColor];
    
    
    // すべてのナビバーのタイトルの位置を調整する
    [[UINavigationBar appearance] setTitleVerticalPositionAdjustment:-100 forBarMetrics:UIBarMetricsDefault];
    
    
    
    
    
}

+ (void)initialize
{
    // すべてのナビバーのタイトルの位置を調整する
    [[UINavigationBar appearance] setTitleVerticalPositionAdjustment:-10 forBarMetrics:UIBarMetricsDefault];

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
