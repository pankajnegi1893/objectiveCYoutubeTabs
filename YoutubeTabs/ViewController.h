//
//  ViewController.h
//  YoutubeTabs
//
//  Created by Pankaj Negi on 16/06/17.
//

#import <UIKit/UIKit.h>
#import "Setting.h"

@interface ViewController : UICollectionViewController   <UICollectionViewDelegateFlowLayout>
-(void)showControllerForSetting : (Setting *)setting;
-(void)scrollToMenuIndex : (NSInteger)menuIndex;
@end

