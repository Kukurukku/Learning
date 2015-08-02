//
//  ZFMitemViewController.m
//  fortunemailapp
//
//  Created by 東屋 百合絵 on 2015/08/02.
//  Copyright (c) 2015年 Zappallas. All rights reserved.
//

#import "ZFMitemViewController.h"
#import "ZFMFTProfileViewController.h"

@interface ZFMitemViewController ()

@end

@implementation ZFMitemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    if ([[segue identifier] isEqualToString:@"ftProfile"]) {
        ZFMFTProfileViewController *a = [segue destinationViewController];
        // 占い師IDサンプル
        a.ftID = @"1234";
    }
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
