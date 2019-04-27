//
//  ViewController.h
//  YoutubeTabs
//
//  Created by Anil Singh Bisht on 16/06/17.
//  Copyright © 2017 soarlogic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Setting.h"

@interface ViewController : UICollectionViewController   <UICollectionViewDelegateFlowLayout>
-(void)showControllerForSetting : (Setting *)setting;
-(void)scrollToMenuIndex : (NSInteger)menuIndex;
@end

