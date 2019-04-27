//
//  Setting.h
//  YoutubeTabs
//
//  Created by Anil Singh Bisht on 24/06/17.
//  Copyright © 2017 soarlogic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Setting : NSObject
@property (nonatomic , copy) NSString *settingName;
@property (nonatomic , copy) NSString *settingImageName;

- (Setting *)initWithSettingName:(NSString *)settingName settingImageName :(NSString *)settingImageName;
@end
