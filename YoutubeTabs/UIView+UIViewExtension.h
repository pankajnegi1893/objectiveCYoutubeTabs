//
//  UIView+UIViewExtension.h
//  YoutubeTabs
//  Created by Pankaj Negi on 16/06/17.
//

#import <UIKit/UIKit.h>

@interface UIView (UIViewExtension)
-(void)addConstraintsWithFormat : (NSString *) format  views : (UIView *) constraintsView, ...;
@end
