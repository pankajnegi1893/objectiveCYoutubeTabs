//
//  Videos.h
//  YoutubeTabs
//
//  Created by Pankaj Negi on 16/06/17.
//

#import <Foundation/Foundation.h>
#import "Channel.h"

@interface Videos : NSObject
@property (nonatomic , copy) NSString *thumnailsImage;
@property (nonatomic , copy) NSString *videoTitle;
@property (nonatomic , strong) Channel *channel;
@property (nonatomic , copy) NSNumber *numberofViews;
@property (nonatomic , copy) NSDate *uploadedDate;
@end
