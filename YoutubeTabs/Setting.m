//
//  Setting.m
//  YoutubeTabs
//
//  Created by Pankaj Negi on 16/06/17.
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


