//
//  SettingLauncher.h
//  YoutubeTabs
//
//  Created by Pankaj Negi on 16/06/17.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface SettingLauncher : NSObject  <UICollectionViewDelegate , UICollectionViewDataSource>
-(void)showSettings;
@property (nonatomic , strong) ViewController *viewController;
@end
