//
//  OptionViewController.h
//  sentakushrine
//
//  Created by 東屋 百合絵 on 2015/05/10.
//  Copyright (c) 2015年 東屋　百合絵. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface OptionViewController : UIViewController{
    CFURLRef        soundURL;
    SystemSoundID   soundID;
}
@property (strong, nonatomic) IBOutlet UIButton *backButton;
@property (strong, nonatomic) IBOutlet UIButton *soundButton;
@property (strong, nonatomic) IBOutlet UIButton *historyButton;

@property (weak,nonatomic) NSUserDefaults *defaults;
@property (readwrite) CFURLRef      soundURL;
@property (readonly) SystemSoundID  soundID;


-(IBAction)onBackButton:(id)sender;
-(IBAction)onSoundButton:(id)sender;
-(IBAction)onHistoryButton:(id)sender;
@end
