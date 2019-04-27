//
//  MenuBar.h
//  YoutubeTabs
//
//  Created by Anil Singh Bisht on 17/06/17.
//  Copyright © 2017 soarlogic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface MenuBar : UIView <UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout>
@property (nonatomic , strong) NSLayoutConstraint *horizontalBarLeftConstraint;
@property (strong, nonatomic)  UICollectionView *collectionView;
@property (nonatomic , strong) ViewController *viewController;
@end
