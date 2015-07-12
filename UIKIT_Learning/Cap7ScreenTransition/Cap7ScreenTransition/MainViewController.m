//
//  MainViewController.m
//  Cap7ScreenTransition
//
//  Created by 東屋 百合絵 on 2015/07/12.
//  Copyright (c) 2015年 TestProject. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()<UIViewControllerTransitioningDelegate,InteractionTransitionControllerDelegate>
@property (nonatomic)InteractionTransitionAnimation * interactionController;


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

// モーダルビュー表示時のアニメーションコントローラ
-(id <UIViewControllerAnimatedTransitioning>)
    animationControllerForPresentedController:(UIViewController *)presented
    presentingController:(UIViewController *)presenting
    sourceController:(UIViewController *)source{
    
    CustomTransitionAnimation *controller = [[CustomTransitionAnimation alloc]init];
    controller.presenting = YES;
    return controller;
}

// モーダルビュー消去時のアニメーションコントローラ
-(id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    CustomTransitionAnimation *controller = [[CustomTransitionAnimation alloc]init];
    controller.presenting = NO;
    return controller;
}

- (IBAction)gotoCustomTransition:(id)sender {
    
    ModalViewController * mVC = [ModalViewController new];

    
    // 画面遷移デリゲートの設定と、画面表示設定をセット
    mVC.transitioningDelegate = self;
    mVC.modalPresentationStyle = UIModalPresentationFullScreen;
    
    [self presentViewController:mVC animated:YES completion:nil];
}

- (IBAction)interactiveTransition:(id)sender {
    
    ModalViewController *mVC = [ModalViewController new];
    mVC.modalPresentationStyle = UIModalPresentationFullScreen;
    
    self.interactionController = [[InteractionTransitionAnimation alloc]init];
    self.interactionController.view = mVC.view;
    self.interactionController.delegate = self;
    
    
    
    [self presentViewController:mVC animated:YES completion:nil];
}

-(id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id<UIViewControllerAnimatedTransitioning>)animator{
    return nil;
}

-(id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator{
    if(self.interactionController != nil && self.interactionController.isInteractive) {
        return self.interactionController;
    }
    return nil;
}

- (void)interactionController:(id<UIViewControllerInteractiveTransitioning>)controller
      interactionBeganAtPoint:(CGPoint)point
{
    if (self.presentedViewController != nil) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
