//
//  UIColor+ColorExtension.m
//  YoutubeTabs
//
//  Created by Anil Singh Bisht on 17/06/17.
//  Copyright © 2017 soarlogic. All rights reserved.
//

#import "UIColor+ColorExtension.h"

@implementation UIColor (ColorExtension)
+ (UIColor *) rgb : (int)red green :(int)green blue : (int) blue{
    
    return  [UIColor colorWithRed: red/255.0f green: green / 255.0f blue: blue/255.0f alpha: 1.0f];
}
@end
