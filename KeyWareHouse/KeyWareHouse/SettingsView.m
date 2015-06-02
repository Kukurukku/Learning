//
//  Settingsview.m
//  KeyWareHouse
//
//  Created by 東屋 百合絵 on 2015/05/31.
//  Copyright (c) 2015年 TestProject. All rights reserved.
//

#import "SettingsView.h"

@implementation SettingsView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)didMoveToSuperview{

    [super didMoveToSuperview];
}

- (IBAction)onChangePassButton:(id)sender {
    AppPassRegisterViewController *appPassRegisterViewController = [[AppPassRegisterViewController alloc]init];
    /*appPassRegisterViewController.modalPresentationStyle = UIModalPresentationOverFullScreen;*/
    
    [self.mainviewController.navigationController pushViewController:appPassRegisterViewController animated:YES];

    NSLog(@"アプリパス登録画面を表示する予定");

}

- (IBAction)onUpdatePassButton:(id)sender {
    }
@end
