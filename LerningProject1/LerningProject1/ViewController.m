//
//  ViewController.m
//  LerningProject1
//
//  Created by 東屋 百合絵 on 2015/01/31.
//  Copyright (c) 2015年 TestProject. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
     // バンドルを取得する
     NSBundle *bundle = [NSBundle mainBundle];
     NSString *bid = [bundle bundleIdentifier];
     
     CommonStatusCheck *myClass =[CommonStatusCheck alloc];
    
     //パラメータにバンドルIDとdebugかどうかのフラグを渡す
    [myClass Check002:bid serverUrl:LOGIC_SERVER_URL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
