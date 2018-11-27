//
//  ViewController.m
//  iosbeginch22
//
//  Created by annilq on 2018/11/26.
//  Copyright © 2018年 annilq. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak,nonatomic) IBOutlet UILabel *localLabel;
@property (strong,nonatomic) IBOutletCollection(UILabel) NSArray *labels;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLocale *locale=[NSLocale currentLocale];
    NSString *currentLangID=[[NSLocale preferredLanguages] objectAtIndex:0];
    NSString *displayStrng=[locale displayNameForKey:NSLocaleLanguageCode value:currentLangID];
    NSString *capitalized=[displayStrng capitalizedStringWithLocale:locale];
    self.localLabel.text=capitalized;
    [self.labels[0] setText:NSLocalizedString(@"LABEL_ONE", @"the number 1")];
    [self.labels[1] setText:NSLocalizedString(@"LABEL_TWO", @"the number 2")];
    [self.labels[2] setText:NSLocalizedString(@"LABEL_THIRD", @"the number 3")];
    [self.labels[3] setText:NSLocalizedString(@"LABEL_FOURTH", @"the number 4")];
    [self.labels[4] setText:NSLocalizedString(@"LABEL_FIFTH", @"the number 5")];
}


@end
