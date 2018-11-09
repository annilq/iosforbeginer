//
//  FontInfoViewController.h
//  iosbenginch9
//
//  Created by annilq on 2018/11/9.
//  Copyright © 2018年 annilq. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FontInfoViewController : UIViewController
@property (strong,nonatomic) UIFont *font;
@property (assign,nonatomic) BOOL favorite;
@end

NS_ASSUME_NONNULL_END
