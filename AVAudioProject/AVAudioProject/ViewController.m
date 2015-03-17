//
//  ViewController.m
//  AVAudioProject
//
//  Created by 東屋 百合絵 on 2015/03/14.
//  Copyright (c) 2015年 東屋　百合絵. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
@property (strong, nonatomic) AVAudioEngine *audioEngine;
@property (strong, nonatomic) AVAudioPlayerNode *playNode;
@property (strong, nonatomic) AVAudioFile *aFile;
@property (strong, nonatomic) AVAudioUnitDelay *delayNode;
@property (strong, nonatomic) AVAudioUnitDistortion *distNode;
@property (strong, nonatomic) AVAudioUnitReverb *reverbNode;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // AVAudioEngineセットアップ
    if (![self setup]) {
        NSLog(@"AudioEngine Setup Failed.");
    }
    
    // 初期化処理
    [self setUpParameter];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/**
 AVAudioEngineセットアップ
 */
-(BOOL)setup{
    
    NSError *error = nil;

    // AVAudioEngineを作成
    self.audioEngine = [[AVAudioEngine alloc]init];
    
    // 曲ファイル
    NSURL *fileURL = [[NSBundle mainBundle] URLForAuxiliaryExecutable:@"ika_title.mp3"];
    self.aFile = [[AVAudioFile alloc]initForReading:fileURL error:&error];
    
    // playNode作成
    self.playNode = [[AVAudioPlayerNode alloc]init];
    
    // ディストーションノード設定
    self.distNode = [[AVAudioUnitDistortion alloc]init];
    [self.distNode loadFactoryPreset:AVAudioUnitDistortionPresetDrumsLoFi];
    
    
    // ディレイノード設定
    self.delayNode = [[AVAudioUnitDelay alloc]init];
    self.delayNode.delayTime = 0.5f;
    
    // リバーブノード設定
    self.reverbNode = [[AVAudioUnitReverb alloc]init];
    [self.reverbNode loadFactoryPreset:AVAudioUnitReverbPresetLargeHall];
    self.reverbNode.wetDryMix = 50.0f;
    
    
    // audioEngineにNode登録
    [self.audioEngine attachNode:self.playNode];
    [self.audioEngine attachNode:self.delayNode];
    [self.audioEngine attachNode:self.distNode];
    [self.audioEngine attachNode:self.reverbNode];
    
    
    // node接続
    // playnode▶︎delay
    [self.audioEngine connect:self.playNode to:self.delayNode format:self.aFile.processingFormat];
    
    // delay▶︎distortion
    [self.audioEngine connect:self.delayNode to:self.distNode format:self.aFile.processingFormat];
    
    // distortion▶︎reverb
    [self.audioEngine connect:self.distNode to:self.reverbNode format:self.aFile.processingFormat];
    
    // reverb▶︎mainMixer
    [self.audioEngine connect:self.reverbNode to:self.audioEngine.mainMixerNode format:self.aFile.processingFormat];
    
    
    // AVAudioEngine開始
    if (![self.audioEngine startAndReturnError:&error]) {
        return NO;
    }
    

    return YES;

}

/**
 画面項目の初期化
 */
-(void)setUpParameter{
    
    // 曲の再生初期化(曲停止)
    [self.musicButton setTitle:@"STOP" forState:UIControlStateNormal];
    self.musicPlaing = false;

    // 各種エフェクターをOFF状態にする
    self.distSc.selectedSegmentIndex = 1;
    self.distNode.bypass = true;
    self.delaySc.selectedSegmentIndex = 1;
    self.delayNode.bypass = true;
    self.distSc.selectedSegmentIndex = 1;
    self.reverbSc.selectedSegmentIndex = 1;
    self.reverbNode.wetDryMix = 00.0f;
    
    // スライダー最大最小値設定後、中庸に
    self.reverbDepthSL.minimumValue = 0.0f;
    self.reverbDepthSL.maximumValue = 50.0f;
    self.delayTimeSL.minimumValue = 0.0f;
    self.delayTimeSL.maximumValue = 10.0f;
    self.reverbDepthSL.value = 25.0f;
    self.delayTimeSL.value = 0.5f;
    

    
}

// 再生を繰り返す
-(void)play{
    
    [self.playNode scheduleFile:self.aFile
                           atTime:nil
                completionHandler:^{
                    
                    // repeat
                    [self play];
                }];
    
    [self.playNode play];

    
}

#pragma mark - Button EFFECT ON/OFF

/**
 音楽再生/停止ボタン
 */
-(IBAction)playSwitch:(id)sender{
    
    
    // 曲が再生中なら曲を止める
    if(self.musicPlaing){
        [self.musicButton setTitle:@"STOP" forState:UIControlStateNormal];
        self.musicPlaing = false;
        
        self.reverbNode.wetDryMix = 00.0f;
        self.delayNode.delayTime = 0.0f;
        
        [self.playNode stop];
        
    } else {
        // 曲が停止中なら曲を再開
        [self.musicButton setTitle:@"START" forState:UIControlStateNormal];
        self.musicPlaing = true;
        
        self.reverbNode.wetDryMix = self.reverbDepthSL.value;
        self.delayNode.delayTime = self.delayTimeSL.value;
        
        [self play];
    }
    
}

/**
 ディストーションON/OFFスイッチ
 */
-(IBAction)distScChanged:(id)sender{
    
    switch (self.distSc.selectedSegmentIndex) {
        case 0:
            self.distNode.bypass = false;
            break;
        case 1:
            self.distNode.bypass = true;
            break;
            
        default:
            break;
    }

    
    
}

/**
 ディレイON/OFFスイッチ
 */
-(IBAction)delayScChanged:(id)sender{
    
    
    switch (self.delaySc.selectedSegmentIndex) {
        case 0:
            self.delayNode.bypass = false;
            break;
        case 1:
            self.delayNode.bypass = true;
            break;
            
        default:
            break;
    }
    
    
}

/**
 リバーブON/OFFスイッチ
 */
-(IBAction)reverbScChanged:(id)sender{
    
    switch (self.reverbSc.selectedSegmentIndex) {
        case 0:
            self.reverbNode.wetDryMix = self.reverbDepthSL.value;
            break;
        case 1:
            self.reverbNode.wetDryMix = 00.0f;
            break;
            
        default:
            break;
    }
    
}

/**
 Delay時間スライダー
 */
-(IBAction)delayTimeSLChanged:(id)sender{

    self.delayNode.delayTime = self.delayTimeSL.value;
}

/**
 リバーブ深さスライダー
 */
-(IBAction)reverbDepthSLChanged:(id)sender{
    
    if(self.reverbSc.selectedSegmentIndex !=1){
        self.reverbNode.wetDryMix = self.reverbDepthSL.value;
    }
}




@end
