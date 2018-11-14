//
//  LanguageListController.h
//  iosbeginch11
//
//  Created by annilq on 2018/11/14.
//  Copyright © 2018年 annilq. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;
@interface LanguageListController : UITableViewController
@property (weak,nonatomic) DetailViewController *detailViewController;
@property (copy,nonatomic) NSArray *languageNames;
@property (copy,nonatomic) NSArray *languageCodes;
@end

