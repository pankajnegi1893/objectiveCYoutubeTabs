//
//  SettingEnum.m
//  YoutubeTabs
//
//  Created by Anil Singh Bisht on 24/06/17.
//  Copyright © 2017 soarlogic. All rights reserved.
//

#import "SettingEnum.h"

@implementation SettingEnum

+(void) run{
    typedef NS_ENUM(NSInteger , SettingValue) {
        SettingValueSetting,
        SettingValueTermPrivacy,
        SettingValueSendFeedback,
        SettingValueHelp,
        SettingValueSwitchAccount,
        SettingValueCancel,
        
    };
}
@end
