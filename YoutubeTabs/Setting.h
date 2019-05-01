//
//  Setting.h
//  YoutubeTabs
//
//  Created by Pankaj Negi on 16/06/17.
//

#import <Foundation/Foundation.h>

@interface Setting : NSObject
@property (nonatomic , copy) NSString *settingName;
@property (nonatomic , copy) NSString *settingImageName;

- (Setting *)initWithSettingName:(NSString *)settingName settingImageName :(NSString *)settingImageName;
@end
