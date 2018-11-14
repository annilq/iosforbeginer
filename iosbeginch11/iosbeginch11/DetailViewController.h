//
//  DetailViewController.h
//  iosbeginch11
//
//  Created by annilq on 2018/11/14.
//  Copyright © 2018年 annilq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) NSString *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (weak,nonatomic) IBOutlet UIWebView *webView;
@property (strong,nonatomic) UIBarButtonItem *languageButton;
@property (strong,nonatomic) UIViewController *languagePopoverController;
@property (copy,nonatomic)NSString *languageString;
@end

