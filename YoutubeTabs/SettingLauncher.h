//
//  SettingLauncher.h
//  YoutubeTabs
//
//  Created by Anil Singh Bisht on 23/06/17.
//  Copyright © 2017 soarlogic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface SettingLauncher : NSObject  <UICollectionViewDelegate , UICollectionViewDataSource>
-(void)showSettings;
@property (nonatomic , strong) ViewController *viewController;
@end
