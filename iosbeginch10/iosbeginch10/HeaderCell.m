//
//  HeaderCell.m
//  iosbeginch10
//
//  Created by annilq on 2018/11/13.
//  Copyright © 2018年 annilq. All rights reserved.
//

#import "HeaderCell.h"

@implementation HeaderCell
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if(self){
        self.label.backgroundColor=[UIColor colorWithRed:0.9 green:0.9 blue:0.8 alpha:1.0];
        self.label.textColor=[UIColor blackColor];
    }
    return self;
}
+(UIFont *)defaultFont{
    return [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
}
@end
