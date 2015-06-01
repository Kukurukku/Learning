//
//  MainViewController.m
//  KeyWareHouse
//
//  Created by 東屋 百合絵 on 2015/05/31.
//  Copyright (c) 2015年 TestProject. All rights reserved.
//

#import "MainViewController.h"

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
    
    
    self.views = [NSArray arrayWithObjects:self.wareHouseView,self.settingsView, nil];
    [self.tabBarController setViewControllers:self.views animated:NO];
    
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
