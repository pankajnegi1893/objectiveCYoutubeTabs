//
//  Setting.m
//  YoutubeTabs
//
//  Created by Anil Singh Bisht on 24/06/17.
//  Copyright © 2017 soarlogic. All rights reserved.
//

#import "Setting.h"

@implementation Setting
//@synthesize  settingName , settingImageName;


- (Setting *)initWithSettingName:(NSString *)settingName settingImageName :(NSString *)settingImageName{
    self.settingName = settingName;
    self.settingImageName = settingImageName;
    return self;
}

@end


