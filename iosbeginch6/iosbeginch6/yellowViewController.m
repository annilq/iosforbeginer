//
//  yellowViewController.m
//  iosbeginch6
//
//  Created by annilq on 2018/11/5.
//  Copyright © 2018年 annilq. All rights reserved.
//

#import "yellowViewController.h"

@interface yellowViewController ()

@end

@implementation yellowViewController

-(IBAction)yellowbtnPress:(id)sender{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"yelllow" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [self presentViewController:alert animated:YES completion:NULL];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
