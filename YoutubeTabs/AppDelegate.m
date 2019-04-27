//
//  AppDelegate.m
//  YoutubeTabs
//
//  Created by Anil Singh Bisht on 16/06/17.
//  Copyright © 2017 soarlogic. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "UIColor+ColorExtension.h"
#import "UIView+UIViewExtension.h"


@interface AppDelegate ()

@end


@implementation AppDelegate



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame: [[UIScreen mainScreen]bounds]];
   // window = UIWindow(frame : UIScreen.mainScreen().bounds) in swift same code
    [self.window makeKeyAndVisible];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
   // layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    ViewController *viewController = [[ViewController alloc] initWithCollectionViewLayout: layout];
    
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:
                                      viewController];
    
    // set Navigation Bar color to red like Youtube
    [[UINavigationBar appearance ] setBarTintColor: [UIColor rgb: 230 green: 32 blue: 31]];
   
    // set the statusBar to light
    application.statusBarStyle = UIStatusBarStyleLightContent;
    
    // get Rid of black bar underneath navbar
    [[UINavigationBar appearance] setShadowImage: [UIImage new]];
    [[UINavigationBar appearance] setBackgroundImage: [UIImage new] forBarMetrics: UIBarMetricsDefault];
    
    // for setting the statusBar Color to dark
    UIView *statusBarBackgroundView = [[UIView alloc] init];
    statusBarBackgroundView.backgroundColor = [UIColor rgb: 194 green: 31 blue: 31];
    [self.window addSubview: statusBarBackgroundView];
    
    [self.window addConstraintsWithFormat: @"H:|[v0]|" views: statusBarBackgroundView , nil];
    [self.window addConstraintsWithFormat: @"V:|[v0(20)]" views: statusBarBackgroundView , nil];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
