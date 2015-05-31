//
//  OptionViewController.m
//  sentakushrine
//
//  Created by 東屋 百合絵 on 2015/05/10.
//  Copyright (c) 2015年 東屋　百合絵. All rights reserved.
//

#import "OptionViewController.h"


@interface OptionViewController ()

@end

bool soundON;

@implementation OptionViewController
@synthesize backButton = _backButton;
@synthesize soundButton = _soundButton;

@synthesize soundURL;
@synthesize soundID;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 効果音のファイルを読み込む
    NSString *path = [[NSBundle mainBundle] pathForResource:@"se_tudumi" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:path];
    AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(url), &soundID);
    /*CFBundleRef mainBundle;
    mainBundle =  CFBundleGetMainBundle();
    
    soundURL = CFBundleCopyResourceURL(mainBundle, CFSTR("se_tudumi"), CFSTR("mp3"), NULL);
    AudioServicesCreateSystemSoundID(soundURL, &soundID);
    CFRelease(soundURL);*/
    
    // 音を出す設定を呼び出す
    // インスタンスを取得
    _defaults = [NSUserDefaults standardUserDefaults];
    
    // データを取得
    NSString *data = [_defaults stringForKey:@"SOUND"];
    
    // まだ音設定がされていない場合、ON状態を保存する
    if(data == nil){
    
        [_defaults setObject:@"ON" forKey:@"SOUND"];
        [_defaults synchronize];
        
        data = [_defaults stringForKey:@"SOUND"];
    }
    
    // 前回の音設定を呼び出す
    if([data  isEqual: @"ON"]){
        [_soundButton setBackgroundImage:[UIImage imageNamed:@"sound_button_on.png"] forState:UIControlStateNormal];
        soundON = true;
    
    } else {
        [_soundButton setBackgroundImage:[UIImage imageNamed:@"sound_button_off.png"] forState:UIControlStateNormal];
        soundON = false;
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 音on/offきりかえボタン押下
 */
-(IBAction)onSoundButton:(id)sender{
    
    if(soundON) {
        [_soundButton setBackgroundImage:[UIImage imageNamed:@"sound_button_off.png"] forState:UIControlStateNormal];
        
        soundON = false;
    } else {
        AudioServicesPlaySystemSound(soundID);
        [_soundButton setBackgroundImage:[UIImage imageNamed:@"sound_button_on.png"] forState:UIControlStateNormal];
        
        soundON = true;
    }

}
/**
 りれきボタン押下
 */
-(IBAction)onHistoryButton:(id)sender{
}

/**
 戻るボタン押下
 */
-(IBAction)onBackButton:(id)sender{
    
    // 現在のサウンドの状態を書き込む
    NSString *soundStatus;
    
    if(soundON){
        soundStatus = @"ON";
    } else {
        soundStatus = @"OFF";
    }

    [_defaults setObject:soundStatus forKey:@"SOUND"];
    [_defaults synchronize];
    
    [self.navigationController popViewControllerAnimated:YES];
}


@end
