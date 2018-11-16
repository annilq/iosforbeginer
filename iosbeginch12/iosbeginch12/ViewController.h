//
//  ViewController.h
//  iosbeginch12
//
//  Created by annilq on 2018/11/15.
//  Copyright © 2018年 annilq. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kOfficerKey     @"officer"
#define kCodeKey        @"code"
#define kRankKey        @"rank"
#define kWarpDriveKey   @"drive"
#define kFactorKey      @"factor"
@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *officerLabel;
@property (weak, nonatomic) IBOutlet UILabel *codeLabel;
@property (weak, nonatomic) IBOutlet UILabel *rankLabel;
@property (weak, nonatomic) IBOutlet UILabel *driveLabel;
@property (weak, nonatomic) IBOutlet UILabel *factorLabel;
@end

