//
//  MenuBar.h
//  YoutubeTabs
//
//  Created by Pankaj Negi on 16/06/17.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface MenuBar : UIView <UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout>
@property (nonatomic , strong) NSLayoutConstraint *horizontalBarLeftConstraint;
@property (strong, nonatomic)  UICollectionView *collectionView;
@property (nonatomic , strong) ViewController *viewController;
@end
