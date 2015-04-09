//
//  RootViewController.m
//  UIViewControllerTEST
//
//  Created by 東屋　百合絵 on 2015/04/07.
//  Copyright (c) 2015年 東屋　百合絵. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // これを設定しないと、rootviewControllerがNavigationController経由で表示され、barの下にめり込んでしまう。
    self.edgesForExtendedLayout = UIRectEdgeNone;
    // Do any additional setup after loading the view from its nib.
    
    UIBarButtonItem* left1 = [[UIBarButtonItem alloc]
                              initWithTitle:@"左1"
                              style:UIBarButtonItemStyleBordered
                              target:self
                              action:nil];
    
    self.navigationItem.leftBarButtonItems = @[left1];
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

@end
