//
//  Videos.h
//  YoutubeTabs
//
//  Created by Anil Singh Bisht on 22/06/17.
//  Copyright © 2017 soarlogic. All rights reserved.
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
