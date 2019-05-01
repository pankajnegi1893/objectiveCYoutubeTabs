//
//  UIView+UIViewExtension.m
//  YoutubeTabs
//  Created by Pankaj Negi on 16/06/17.
//

#import "UIView+UIViewExtension.h"

@implementation UIView (UIViewExtension)

-(void)addConstraintsWithFormat : (NSString *) format  views : (UIView *) constraintsView, ... {
    
    NSInteger index = 0;
    NSMutableDictionary *viewDic = [[NSMutableDictionary alloc]init];
    
    va_list constraintsViewArgs;
    va_start(constraintsViewArgs,  constraintsView);
    
    for(UIView *arg = constraintsView ; arg != nil ; arg = va_arg( constraintsViewArgs, UIView*)){
        NSString *key = [NSString stringWithFormat: @"v%ld" , index];
        arg.translatesAutoresizingMaskIntoConstraints = NO;
        [viewDic setObject: arg forKey: key];
        index++;
        
    }
    
    va_end(constraintsViewArgs);
    
    [self addConstraints:  [NSLayoutConstraint constraintsWithVisualFormat: format options:0 metrics: nil views: viewDic ]];
    
}

@end
