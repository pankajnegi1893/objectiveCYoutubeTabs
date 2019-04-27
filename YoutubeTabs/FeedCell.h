//
//  FeedCell.h
//  YoutubeTabs
//
//  Created by Anil Singh Bisht on 25/06/17.
//  Copyright © 2017 soarlogic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Videos.h"

@interface FeedCell : UICollectionViewCell <UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout>
@property (nonatomic , strong) UICollectionView *collectionView;
@property (nonatomic , strong) NSMutableArray<Videos *> *videosListArray;
-(NSMutableArray<Videos *> *)videosListArray;
@end
