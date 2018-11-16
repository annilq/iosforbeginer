//
//  SettingController.m
//  iosbeginch12
//
//  Created by annilq on 2018/11/15.
//  Copyright © 2018年 annilq. All rights reserved.
//

#import "SettingController.h"
#import "ViewController.h"
@interface SettingController ()
@property (weak, nonatomic) IBOutlet UISwitch *engines;
@property (weak, nonatomic) IBOutlet UISlider *factor;
@property (weak, nonatomic) IBOutlet UILabel *factorLabel;
-(void)refreshFields;
-(IBAction)enginSwitchTapped;
-(IBAction)sliderTouch;
@end

@implementation SettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self refreshFields];
}
-(void)refreshFields{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    self.engines.on=[defaults boolForKey:kWarpDriveKey];
    self.factor.value=[defaults floatForKey:kFactorKey];
    self.factorLabel.text=[[defaults objectForKey:kFactorKey] stringValue];
}
-(IBAction)enginSwitchTapped{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults setBool:self.engines.on forKey:kWarpDriveKey];
    [defaults synchronize];
}
-(IBAction)sliderTouch{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults setFloat:self.factor.value forKey:kFactorKey];
    self.factorLabel.text=[NSString stringWithFormat:@"%f",self.factor.value];
    [defaults synchronize];
}
-(void)applicationWillEnterForeground:(NSNotification *)notifycation{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    [self refreshFields];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    UIApplication *app=[UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillEnterForeground:) name:UIApplicationWillEnterForegroundNotification object:app];
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
- (IBAction)done:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
