//
//  KeyChainViewController.h
//  practice1app
//
//  Created by 東屋　百合絵 on 2015/07/08.
//  Copyright (c) 2015年 東屋　百合絵. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KeyChainViewController : UIViewController

+(KeyChainViewController*)keyChainViewController;

- (IBAction)saveData:(id)sender;
- (IBAction)loadData:(id)sender;
- (IBAction)deleteData:(id)sender;

@end
