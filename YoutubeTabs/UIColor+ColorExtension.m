//
//  UIColor+ColorExtension.m
//  YoutubeTabs
//
//  Created by Pankaj Negi on 16/06/17.
//

#import "UIColor+ColorExtension.h"

@implementation UIColor (ColorExtension)
+ (UIColor *) rgb : (int)red green :(int)green blue : (int) blue{
    
    return  [UIColor colorWithRed: red/255.0f green: green / 255.0f blue: blue/255.0f alpha: 1.0f];
}
@end
