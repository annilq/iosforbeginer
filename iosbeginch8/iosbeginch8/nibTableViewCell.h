//
//  nibTableViewCell.h
//  iosbeginch8
//
//  Created by annilq on 2018/11/7.
//  Copyright © 2018年 annilq. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface nibTableViewCell : UITableViewCell
@property (strong,nonatomic) IBOutlet UILabel *nameLable;
@property (strong,nonatomic) IBOutlet UILabel *colorLable;
@end

NS_ASSUME_NONNULL_END
