//
//  UIColor+Random.h
//  iosbeginch16
//
//  Created by annilq on 2018/11/21.
//  Copyright © 2018年 annilq. All rights reserved.
//

#import "UIColor+Random.h"
#define ARC4RANDOM_MAX 0x100000000LL
@implementation UIColor (Random)
+ (UIColor *)randomColor{
    CGFloat red=(CGFloat)arc4random()/(CGFloat)ARC4RANDOM_MAX;
    CGFloat blue=(CGFloat)arc4random()/(CGFloat)ARC4RANDOM_MAX;
    CGFloat green=(CGFloat)arc4random()/(CGFloat)ARC4RANDOM_MAX;
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}
@end
