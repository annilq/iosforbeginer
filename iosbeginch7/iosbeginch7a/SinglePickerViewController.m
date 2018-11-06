//
//  SinglePickerViewController.m
//  iosbeginch7
//
//  Created by annilq on 2018/11/5.
//  Copyright © 2018年 annilq. All rights reserved.
//

#import "SinglePickerViewController.h"

@interface SinglePickerViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (strong,nonatomic) NSArray *characterNames;
@end

@implementation SinglePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.characterNames=@[@"Luke",@"Lucy",@"Lily",@"Lilei",@"hanmm"];
    // Do any additional setup after loading the view.
}
- (IBAction)buttonpresed:(UIButton *)sender {
    NSInteger row=[self.pickerView selectedRowInComponent:0];
    NSString *message=self.characterNames[row];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"您选择的是" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [self presentViewController:alert animated:NO completion:nil];
}
#pragma mark
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.characterNames count];
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return self.characterNames[row];
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
