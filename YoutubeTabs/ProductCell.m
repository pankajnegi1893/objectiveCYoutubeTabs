//
//  ProductCell.m
//  YoutubeTabs
//
//  Created by Anil Singh Bisht on 25/06/17.
//  Copyright © 2017 soarlogic. All rights reserved.
//

#import "ProductCell.h"
#import "Videos.h"
#import "FeedCell.h"

@interface  ProductCell()
@property (nonatomic , strong)  NSMutableArray<Videos *> *videosListArray;;
@end
@implementation ProductCell

-(NSMutableArray<Videos *> *)videosListArray{
    
     self.videosListArray = [super videosListArray];
   
        
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
        
        
        
        [self.videosListArray addObject: video1];
        [self.videosListArray addObject: video2];
        [self.videosListArray addObject: video3];
        [self.videosListArray addObject: video4];
        [self.videosListArray addObject: video5];
        
        
    
    return self.videosListArray;
}

@end
