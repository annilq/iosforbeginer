//
//  ViewController.m
//  iosbeginch4
//
//  Created by annilq on 2018/11/2.
//  Copyright © 2018年 annilq. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *psw;

@property (weak, nonatomic) IBOutlet UILabel *slider;
@property (weak, nonatomic) IBOutlet UISwitch *leftswitch;
@property (weak, nonatomic) IBOutlet UISwitch *rightswitch;
@property (weak, nonatomic) IBOutlet UIButton *button;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)submitBtn:(UIButton *)sender {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"操作" message:nil preferredStyle:UIActionSheetStyleDefault];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    
    
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [self presentViewController:alert animated:YES completion:NULL];
}
-(IBAction)backgroundTap:(id)sender{
    [self.name resignFirstResponder];
    [self.psw resignFirstResponder];
}
- (IBAction)valuechange:(UISlider *)sender {
    int progress=lround(sender.value);
    self.slider.text=[NSString stringWithFormat:@"%d",progress];
}
- (IBAction)btnswitch:(UISwitch *)sender {
    [self.leftswitch setOn:sender.isOn animated:YES];
    [self.rightswitch setOn:sender.isOn animated:YES];
}
- (IBAction)segchaged:(UISegmentedControl *)sender {
    if(sender.selectedSegmentIndex==0){
        self.button.hidden=true;
        self.rightswitch.hidden=false;
        self.leftswitch.hidden=false;
    }else{
        self.button.hidden=false;
        self.rightswitch.hidden=true;
        self.leftswitch.hidden=true;
    }
}

@end
