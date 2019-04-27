//
//  MenuCell.m
//  YoutubeTabs
//
//  Created by Anil Singh Bisht on 22/06/17.
//  Copyright © 2017 soarlogic. All rights reserved.
//

#import "MenuCell.h"
#import "UIView+UIViewExtension.h"
#import "UIColor+ColorExtension.h"

@interface MenuCell()


@end
@implementation MenuCell

-(void) setHighlighted:(BOOL)highlighted {
    self.tabImageView.tintColor =   highlighted ?  [UIColor blackColor] : [UIColor rgb: 255 green: 255 blue: 255];
}

-(BOOL) isHighlighted{
    return YES;
}

-(void) setSelected:(BOOL)selected{
   self.tabImageView.tintColor =   selected ?  [UIColor blackColor] : [UIColor rgb: 255 green: 255 blue: 255];
}

-(BOOL)isSelected{
    return YES;
}



-(UIImageView *)tabImageView{
    if(!_tabImageView){
        _tabImageView = [[UIImageView alloc]init];
       }
    return _tabImageView;
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
    [self addSubview: self.tabImageView];
    [self.tabImageView addConstraintsWithFormat: @"H:[v0(28)]" views: self.tabImageView , nil];
     [self.tabImageView addConstraintsWithFormat: @"V:[v0(28)]" views: self.tabImageView , nil];
    
    [self addConstraint: [NSLayoutConstraint constraintWithItem: self.tabImageView attribute: NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem: self attribute: NSLayoutAttributeCenterX multiplier: 1 constant: 0]];
     [self addConstraint: [NSLayoutConstraint constraintWithItem: self.tabImageView attribute: NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem: self attribute: NSLayoutAttributeCenterY multiplier: 1 constant: 0]];
    
    
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
