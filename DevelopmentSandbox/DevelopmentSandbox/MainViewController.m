//
//  MainViewController.m
//  DevelopmentSandbox
//
//  Created by 東屋　百合絵 on 2015/07/13.
//  Copyright (c) 2015年 東屋　百合絵. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation MainViewController

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



-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    
    return CustomAnimatedTransitioning(isPresent: true)
    ;}

@end
