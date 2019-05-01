//
//  FeedCell.h
//  YoutubeTabs
//
//  Created by Pankaj Negi on 16/06/17.
//

#import <UIKit/UIKit.h>
#import "Videos.h"

@interface FeedCell : UICollectionViewCell <UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout>
@property (nonatomic , strong) UICollectionView *collectionView;
@property (nonatomic , strong) NSMutableArray<Videos *> *videosListArray;
-(NSMutableArray<Videos *> *)videosListArray;
@end
