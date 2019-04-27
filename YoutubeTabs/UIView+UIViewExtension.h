//
//  UIView+UIViewExtension.h
//  YoutubeTabs
//
//  Created by Anil Singh Bisht on 17/06/17.
//  Copyright © 2017 soarlogic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (UIViewExtension)
-(void)addConstraintsWithFormat : (NSString *) format  views : (UIView *) constraintsView, ...;
@end
