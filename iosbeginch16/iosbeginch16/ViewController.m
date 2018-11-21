//
//  ViewController.m
//  iosbeginch16
//
//  Created by annilq on 2018/11/21.
//  Copyright © 2018年 annilq. All rights reserved.
//

#import "ViewController.h"
#import "QuartFunView.h"
#import "Constans.h"
#import "UIColor+Random.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *colorControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)changeColor:(UISegmentedControl *)sender {
    UISegmentedControl *control=sender;
    ColorTabIndex index=[control selectedSegmentIndex];
//    强制转换，一遍使用属性，并且不能直接init
    QuartFunView *funView=(QuartFunView *)self.view;
    funView.useRandomColor=NO;

    switch (index) {
        case kRedColorTab:
            funView.currentColor=[UIColor redColor];
            break;
        case kBlueColorTab :
            funView.currentColor=[UIColor blueColor];
            break;
        case kYellowColorTab:
            funView.currentColor=[UIColor yellowColor];
            break;
        case kGreenColorTab:
            funView.currentColor=[UIColor greenColor];
            break;
        case kRandomColorTab:
            funView.currentColor=[UIColor randomColor];
            funView.useRandomColor=YES;
            break;

        default:
            break;
    }
    
    
}
- (IBAction)changeShape:(UISegmentedControl *)sender {
    UISegmentedControl *control=sender;
    [(QuartFunView *)self.view setShapeType:control.selectedSegmentIndex];
    [(QuartFunView *)self.view setShapeType:control.selectedSegmentIndex];
    if([control selectedSegmentIndex]==kImageShape){
        self.colorControl.enabled=NO;
    }else{
        self.colorControl.enabled=YES;
    }
}

@end
