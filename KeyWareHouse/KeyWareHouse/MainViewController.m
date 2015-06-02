//
//  MainViewController.m
//  KeyWareHouse
//
//  Created by 東屋 百合絵 on 2015/05/31.
//  Copyright (c) 2015年 TestProject. All rights reserved.
//

#import "MainViewController.h"
#import "CustomBaseView.h"

@interface MainViewController ()
@property NSArray *views;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"パスワード金庫";
    // 新規追加ボタンをnavigationbarに設ける
    UIButton *addButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    [addButton addTarget:self action:@selector(onAddButton) forControlEvents:UIControlEventTouchUpInside];
    [addButton setTitle:@"+" forState:UIControlStateNormal];
    [addButton setTintColor:[UIColor blueColor]];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:addButton];
    self.navigationItem.rightBarButtonItem = item;
    
    // タブのタグはxibで付与する
    
    // タブをcontentviewに登録する
    self.views = [NSArray arrayWithObjects:self.settingsView,self.settingsView, nil];
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

-(void)onAddButton{

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

@end
