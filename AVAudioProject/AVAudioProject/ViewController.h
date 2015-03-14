//
//  ViewController.h
//  AVAudioProject
//
//  Created by 東屋 百合絵 on 2015/03/14.
//  Copyright (c) 2015年 東屋　百合絵. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController

@property (weak, nonatomic)IBOutlet UIButton *musicButton;
@property (weak, nonatomic)IBOutlet UISegmentedControl *distSc;
@property (weak, nonatomic)IBOutlet UISegmentedControl *delaySc;
@property (weak, nonatomic)IBOutlet UISegmentedControl *reverbSc;
@property (weak, nonatomic)IBOutlet UISlider *delayTimeSL;
@property (weak, nonatomic)IBOutlet UISlider *reverbDepthSL;
@property (nonatomic)BOOL *musicPlaing;

-(IBAction)playSwitch:(id)sender;

-(IBAction)distScChanged:(id)sender;

-(IBAction)delayScChanged:(id)sender;

-(IBAction)reverbScChanged:(id)sender;



-(IBAction)delayTimeSLChanged:(id)sender;
-(IBAction)reverbDepthSLChanged:(id)sender;
@end
