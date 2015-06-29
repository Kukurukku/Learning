//
//  ViewController.m
//  practice1app
//
//  Created by 東屋　百合絵 on 2015/06/29.
//  Copyright (c) 2015年 東屋　百合絵. All rights reserved.
//


// Header
#import "ViewController.h"

// ViewModel
#import "ViewModel.h"

@interface ViewController ()

@property(nonatomic, strong)ViewModel *model;

@property(nonatomic, weak)IBOutlet UILabel *label;

@end

@implementation ViewController

#pragma mark Dealloc
- (void)dealloc {
    self.model = nil;
}
#pragma mark -

#pragma mark Designated Initializer
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // write your initialize code.
        self.model = [[ViewModel alloc] init];
        DLog(@"ログの出力はDLogで行います。");
    }
    return self;
}
#pragma mark -

#pragma mark Convenience Initializer
+ (ViewController *)viewController {
    NSString *nibName = NSStringFromClass([self class]);
    return [[ViewController alloc] initWithNibName:nibName bundle:[NSBundle mainBundle]];
}
#pragma mark -

#pragma mark Class Methods
#pragma mark -

#pragma mark Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // ViewModelの値の監視を始める
    [self startObserving];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];

    // ViewModelの値の監視を終了
    [self stopObserving];
}

#pragma mark -

#pragma mark KVO
- (void)startObserving {
    [self.model addObserver:self forKeyPath:@"count" options:NSKeyValueObservingOptionNew context:@selector(countUpdated:)];

    // 初回呼び出し
    [self countUpdated:nil];
}

- (void)stopObserving {
    [self.model removeObserver:self forKeyPath:@"count" context:@selector(countUpdated:)];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    [self performSelectorOnMainThread:(SEL)context withObject:change waitUntilDone:YES];
}

- (void)countUpdated:(NSDictionary *)change {
    // ViewModelのプロパティcountの値が変わったらラベルに表示する
    [self.label setText:[NSString stringWithFormat:@"%d",(int)self.model.count]];
}

#pragma mark -

#pragma mark Memory Management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -

#pragma mark Public Methods
#pragma mark -

#pragma mark Private Methods
#pragma mark -

#pragma mark Delegate
#pragma mark -

#pragma mark Action
- (IBAction)tappedButton:(id)sender {
    [self.model increaseCount];
}
#pragma mark -

@end
		
