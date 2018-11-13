//
//  ContentCell.h
//  iosbeginch10
//
//  Created by annilq on 2018/11/13.
//  Copyright © 2018年 annilq. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ContentCell : UICollectionViewCell
@property (strong,nonatomic)UILabel *label;
@property (strong,nonatomic)NSString *text;
+(CGSize)sizeForContentString:(NSString *)string;
@end

NS_ASSUME_NONNULL_END
