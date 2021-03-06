//
//  AppDelegate.m
//  sentakushrine
//
//  Created by 東屋　百合絵 on 2015/04/14.
//  Copyright (c) 2015年 東屋　百合絵. All rights reserved.
//

#import "AppDelegate.h"


@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize topViewController = _topViewController;
@synthesize rootViewController = _rootViewController;
@synthesize historyListViewController = _historyListViewController;
@synthesize window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:NO];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // ナビゲーションコントローラをルートとして設定する
    self.topViewController = [[TopViewController alloc] initWithNibName:@"TopViewController" bundle:nil];
    
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:self.topViewController];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [self.navigationController setToolbarHidden:YES animated:NO];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = self.navigationController;
    [self.window addSubview:self.navigationController.view];
    [self.window makeKeyAndVisible];

    
    
    /* トップにnavigationcontroller使わず遷移してたときのログ
    self.topViewController = [[TopViewController alloc]
     initWithNibName:@"TopViewController" bundle:nil];
     
     self.window.rootViewController = self.topViewController;*/
    
    // 単純な遷移
    /*self.rootViewController = [[RootViewController alloc]
     initWithNibName:@"RootViewController" bundle:nil];
    
    self.window.rootViewController = self.rootViewController;*/
    
    // 一旦tableviewの画面にに差し替え
    /*self.historyListViewController = [[HistoryListViewController alloc]
                               initWithNibName:@"HistoryListViewController" bundle:nil];
    
    self.window.rootViewController = self.historyListViewController;*/
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
