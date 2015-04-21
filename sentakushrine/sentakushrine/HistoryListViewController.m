//
//  HistoryListViewController.m
//  sentakushrine
//
//  Created by 東屋　百合絵 on 2015/04/14.
//  Copyright (c) 2015年 東屋　百合絵. All rights reserved.
//

#import "HistoryListViewController.h"
#import "CustomCell.h"

@interface HistoryListViewController (){
    NSArray *rows;
}


@end

@implementation HistoryListViewController
@synthesize tableView = _tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    rows = @[@"魏",@"呉",@"蜀",@"他"];
    
    // カスタムセル使用
    UINib *nib = [UINib nibWithNibName:@"CustomCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"Cell"];

    
    _tableView.separatorColor = [UIColor clearColor];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

// テーブルの行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    //return 20;
    return rows.count;
}

// 行に表示するデータ
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    /*static NSString* CellIdentifier = @"Cell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil){
    
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    cell.textLabel.text = [NSString stringWithFormat:@"行=%d",indexPath.row];*/
    
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"
                                                       forIndexPath:indexPath];
    
    cell.customLabel.text = rows[indexPath.row];
    
    // 表示する国によって文字色変更
    if([rows[indexPath.row] rangeOfString:@"呉"].location != NSNotFound){
        cell.customLabel.textColor = [UIColor redColor];
    
    } else if([rows[indexPath.row] rangeOfString:@"魏"].location != NSNotFound){
        
        cell.customLabel.textColor = [UIColor blueColor];
        
    } else if([rows[indexPath.row] rangeOfString:@"蜀"].location != NSNotFound){
        cell.customLabel.textColor = [UIColor greenColor];
    } else{
        cell.customLabel.textColor = [UIColor blackColor];
    }
    
    
    return cell;

}
@end
