//
//  SettingCell.m
//  YoutubeTabs
//
//  Created by Anil Singh Bisht on 24/06/17.
//  Copyright © 2017 soarlogic. All rights reserved.
//

#import "SettingCell.h"
#import "UIView+UIViewExtension.h"
#import "UIColor+ColorExtension.h"

@interface SettingCell()
@property (nonatomic , strong) UILabel *settinglabel;
@property (nonatomic , strong) UIImageView *settingImage;
@end
@implementation SettingCell

-(void) setHighlighted:(BOOL)highlighted {
    self.backgroundColor=   highlighted ?  [UIColor darkGrayColor] : [UIColor whiteColor];
    self.settinglabel.textColor =  highlighted ?  [UIColor whiteColor] : [UIColor blackColor];
    self.settingImage.tintColor = highlighted ?  [UIColor whiteColor] : [UIColor darkGrayColor];
}

-(BOOL) isHighlighted{
    return YES;
}

//-(void) setSelected:(BOOL)selected{
//    self.backgroundColor =   selected ?  [UIColor darkGrayColor] : [UIColor rgb: 255 green: 255 blue: 255];
//    self.settinglabel.textColor =  selected ?  [UIColor whiteColor] : [UIColor whiteColor];
//
//}
//
//-(BOOL)isSelected{
//    return YES;
//}

-(void)setSetting:(Setting *)setting{
    self.settinglabel.text = setting.settingName;
    self.settingImage.image = [UIImage imageNamed: setting.settingImageName];
}

-(UILabel *)settinglabel{
    if(!_settinglabel){
        _settinglabel = [[UILabel alloc]init];
        _settinglabel.text = @"Setting";
        _settinglabel.font = [UIFont systemFontOfSize: 13];
    }
    return _settinglabel;
}


-(UIImageView *)settingImage{
    if(!_settingImage){
        _settingImage = [[UIImageView alloc] init];
        _settingImage.image = [[UIImage imageNamed: @"profileImageView"]imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        _settingImage.contentMode = UIViewContentModeScaleAspectFill;
        _settingImage.tintColor = [UIColor darkGrayColor];
        }
    return _settingImage;

}



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpViews];
    }
    return self;
}




-(void)setUpViews{
    
    //self.backgroundColor = [UIColor yellowColor];
    [self addSubview: self.settinglabel];
    [self addSubview: self.settingImage];
    
     [self addConstraintsWithFormat: @"H:|-16-[v0(30)]-8-[v1]|" views: self.settingImage, self.settinglabel , nil];
    
    [self addConstraintsWithFormat: @"V:[v0(30)]" views: self.settingImage , nil];
     [self addConstraintsWithFormat: @"V:|[v0]|" views: self.settinglabel , nil];
    
    [self addConstraint: [NSLayoutConstraint constraintWithItem: self.settingImage attribute: NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem: self attribute: NSLayoutAttributeCenterY multiplier: 1 constant: 0] ];
   
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [NSException raise:@"InitNotImplemented" format:@"Init(Coder) has not been implemented "];
    }
    return self;
}

@end
