//
//  ViewController.m
//  iosbeginch12
//
//  Created by annilq on 2018/11/15.
//  Copyright © 2018年 annilq. All rights reserved.
//

#import "ViewController.h"
#import "SettingController.h"
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
-(void)refreshFields{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    self.officerLabel.text=[defaults objectForKey:kOfficerKey];
    self.codeLabel.text=[defaults objectForKey:kCodeKey];
    self.rankLabel.text=[defaults objectForKey:kRankKey];
    self.driveLabel.text=[defaults boolForKey:kWarpDriveKey]?@"engaged":@"disabled";
    self.factorLabel.text=[[defaults objectForKey:kFactorKey] stringValue];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self refreshFields];
}
- (IBAction)goSettingView:(UIButton *)sender {
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    //将第二个控制器实例化，"SecondViewController"为我们设置的控制器的ID
    SettingController *settingVC = [mainStoryBoard instantiateViewControllerWithIdentifier:@"settingVC"];
//    SettingController *settingVC=[[SettingController alloc] init];
    [settingVC setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    
    [self presentViewController:settingVC animated:YES completion:nil];
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
@end
