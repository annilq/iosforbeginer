//
//  DependentPickerViewController.m
//  iosbeginch7
//
//  Created by annilq on 2018/11/5.
//  Copyright © 2018年 annilq. All rights reserved.
//

#import "DependentPickerViewController.h"

#define kstateComponent 0
#define kzipComponent 1
@interface DependentPickerViewController ()
@property (strong,nonatomic)NSDictionary *stateZips;
@property (strong,nonatomic)NSArray *states;
@property (strong,nonatomic)NSArray *zips;
@property (weak, nonatomic) IBOutlet UIPickerView *dependentPicker;
@end

@implementation DependentPickerViewController
- (IBAction)buttonPressed:(UIButton *)sender {
    NSInteger stateRow=[self.dependentPicker selectedRowInComponent:kstateComponent];
    NSInteger zipRow=[self.dependentPicker selectedRowInComponent:kzipComponent];
    NSString *state=self.states[stateRow];
    NSString *zip=self.zips[zipRow];
    NSString *title=[[NSString alloc] initWithFormat:@"you select zip code is:%@",zip];
    NSString *message=[[NSString alloc] initWithFormat:@"%@ is in %@",zip,state];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [self presentViewController:alert animated:NO completion:nil];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSBundle *bundle=[NSBundle mainBundle];
    NSURL *plistUrl=[bundle URLForResource:@"statedictionary" withExtension:@"plist"];
    self.stateZips=[NSDictionary dictionaryWithContentsOfURL:plistUrl];
    NSArray *allStates=[self.stateZips allKeys];
    NSArray *sortStates=[allStates sortedArrayUsingSelector:@selector(compare:)];
    self.states=sortStates;
    NSString *selectState=self.states[0];
    self.zips=self.stateZips[selectState];
    // Do any additional setup after loading the view.
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if(component==kstateComponent){
        return [self.states count];
    }else{
        return [self.zips count];
    }
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if(component==kstateComponent){
        return self.states[row];
    }else{
        return self.zips[row];
    }
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if(component==kstateComponent){
        NSString *selectState=self.states[row];
        self.zips=self.stateZips[selectState];
        [self.dependentPicker reloadComponent:kzipComponent];
        [self.dependentPicker selectRow:0 inComponent:kzipComponent animated:YES];
    }
}
-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    if(component==kstateComponent){
        return 200;
    }else{
        return 90;
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
