//
//  FeedCell.m
//  YoutubeTabs
//
//  Created by Pankaj Negi on 16/06/17.
//

#import "FeedCell.h"
#import "UIView+UIViewExtension.h"
#import "VideoCell.h"

@interface FeedCell()

@end
@implementation FeedCell


-(NSMutableArray<Videos *> *)videosListArray{
    if(!_videosListArray){
        _videosListArray = [[NSMutableArray alloc]init];
        
        Channel *channel1 =[[Channel alloc] init];
        channel1.name = @"My Channel 1";
        channel1.profileImageName = @"profileImageView";
        
        
        Videos *video1 = [Videos new];
        video1.thumnailsImage = @"thumnail_ImageView";
        video1.videoTitle =  @"ObjectiveC Tutorial 1 :- Youtube";
        video1.channel = channel1;
        video1.numberofViews = [NSNumber numberWithInteger: 34243453];
        
        
        Channel *channel2= [[Channel alloc] init];
        channel2.name = @"My Channel 2";
        channel2.profileImageName = @"profileImageView";
        
        Videos *video2 = [Videos new];
        video2.thumnailsImage = @"thumnail_ImageView";
        video2.videoTitle =  @"ObjectiveC Tutorial 2 :- Youtube Watch This Video";
        video2.channel = channel2;
        video2.numberofViews = [NSNumber numberWithInteger: 26243];
        
        
        Videos *video3 = [Videos new];
        video3.thumnailsImage = @"thumnail_ImageView";
        video3.videoTitle =  @"ObjectiveC Tutorial 3 :- Youtube";
        video3.channel = channel1;
        video3.numberofViews = [NSNumber numberWithInteger: 34243];
        
        
        Videos *video4 = [Videos new];
        video4.thumnailsImage = @"thumnail_ImageView";
        video4.videoTitle =  @"ObjectiveC Tutorial 4 :- Youtube";
        video4.channel = channel2;
        video4.numberofViews = [NSNumber numberWithInteger: 34243];
        
        
        Videos *video5 = [Videos new];
        video5.thumnailsImage = @"thumnail_ImageView";
        video5.videoTitle =  @"ObjectiveC Tutorial 5 :- Youtube";
        video5.channel = channel1;
        video5.numberofViews = [NSNumber numberWithInteger: 34243];
        
        
        
        [_videosListArray addObject: video1];
        [_videosListArray addObject: video2];
        [_videosListArray addObject: video3];
        [_videosListArray addObject: video4];
        [_videosListArray addObject: video5];
    }
    return _videosListArray;
}



-(UICollectionView *)collectionView{
    if(!_collectionView){
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc] initWithFrame: CGRectZero collectionViewLayout: layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        }
    return _collectionView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpViews];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
         [NSException raise:@"InitNotImplemented" format:@"Init(Coder) has not been implemented "];
    }
    return self;
}


-(void)setUpViews{
    
    
    [self addSubview: self.collectionView];
    
    [self addConstraintsWithFormat: @"H:|[v0]|" views: self.collectionView , nil];
    [self addConstraintsWithFormat: @"V:|[v0]|" views: self.collectionView , nil];
    
    [self.collectionView registerClass: VideoCell.self forCellWithReuseIdentifier: @"VideoCellID"];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.videosListArray count];
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    VideoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: @"VideoCellID" forIndexPath: indexPath];

    cell.videos = self.videosListArray[indexPath.item];
   // cell.backgroundColor = [UIColor redColor];
    return cell;
}

// UICollectionViewDelegateFlowLayout method
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    // Video Thumnail image size define based on 1080P or 720P so the ratio is always 16:9 = width : height
    int height = (self.frame.size.width - 16 - 16)  * 9/16; // bcoz view actual 16 is the spacing from left and right side.

     // bcoz of vertical constraint V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|  16 + 8 + 44 + 28 = 96 (approx remainder space)
    return  CGSizeMake(self.frame.size.width, height + 96 );

}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{

    return 0;
}



@end
