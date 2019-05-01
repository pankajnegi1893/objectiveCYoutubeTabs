//
//  SettingEnum.m
//  YoutubeTabs
//
//  Created by Pankaj Negi on 16/06/17.
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
