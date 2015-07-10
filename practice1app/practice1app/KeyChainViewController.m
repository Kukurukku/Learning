//
//  KeyChainViewController.m
//  practice1app
//
//  Created by 東屋　百合絵 on 2015/07/08.
//  Copyright (c) 2015年 東屋　百合絵. All rights reserved.
//

#import "KeyChainViewController.h"
#import "KeyChainModel.h"

@interface KeyChainViewController ()
@property(nonatomic,strong)KeyChainModel* model;
@end

@implementation KeyChainViewController

-(void)dealloc{
    self.model = nil;
}

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

-(void)startObserving{
    [self.model addObserver:self forKeyPath:@"infoData" options:NSKeyValueObservingOptionNew context:@selector(showData)];

}

-(void)stopObserving{
    [self.model addObserver:self forKeyPath:@"infoData" options:NSKeyValueObservingOptionNew context:@selector(showData)];

}

-(void)showData{

}



- (IBAction)saveData:(id)sender {
}

- (IBAction)loadData:(id)sender {
}

- (IBAction)deleteData:(id)sender {
}
@end
