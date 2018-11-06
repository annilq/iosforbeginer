//
//  DoublePickerViewController.m
//  iosbeginch7
//
//  Created by annilq on 2018/11/5.
//  Copyright © 2018年 annilq. All rights reserved.
//

#import "DoublePickerViewController.h"
#define  kFillingComponent 0
#define  kBreadComponent 1
@interface DoublePickerViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *doublePicker;
@property (strong,nonatomic) NSArray *fillingTypes;
@property (strong,nonatomic) NSArray *breadTypes;
@end

@implementation DoublePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fillingTypes=@[@"Ham",@"turkey",@"peanut",@"tuna",@"chiken",@"vegemite"];
    self.breadTypes=@[@"white",@"whole wheat",@"rye",@"seven"];
    // Do any additional setup after loading the view.
}
- (IBAction)buttonPressed:(UIButton *)sender {
    NSInteger fillingrow=[self.doublePicker selectedRowInComponent:kFillingComponent];
    NSInteger breadrow=[self.doublePicker selectedRowInComponent:kBreadComponent];
    NSString *filling=self.fillingTypes[fillingrow];
    NSString *bread=self.breadTypes[breadrow];
    NSString *message=[[NSString alloc] initWithFormat:@"your %@ on %@ bread will be right up",filling,bread];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"您选择的是" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [self presentViewController:alert animated:NO completion:nil];
    
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}
-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if(component==kBreadComponent){
        return [self.breadTypes count];
    }else{
        return [self.fillingTypes count];
    }
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if(component==kBreadComponent){
        return self.breadTypes[row];
    }else{
        return self.fillingTypes[row];
    }
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
