//
//  DatePickerViewController.m
//  iosbeginch7
//
//  Created by annilq on 2018/11/5.
//  Copyright © 2018年 annilq. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation DatePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDate *now=[NSDate date];
    [self.datePicker setDate:now animated:NO];
    // Do any additional setup after loading the view.
}
- (IBAction)buttonPresed:(UIButton *)sender {
    NSDate *select=[self.datePicker date];
    NSString *message=[[NSString alloc] initWithFormat:@"the date and time you select is :%@",select];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"您选择的是" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [self presentViewController:alert animated:YES completion:NULL];
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
