//
//  switchViewController.m
//  iosbeginch6
//
//  Created by annilq on 2018/11/5.
//  Copyright © 2018年 annilq. All rights reserved.
//

#import "switchViewController.h"
#import "blueViewController.h"
#import "yellowViewController.h"
@interface switchViewController ()
@property (strong,nonatomic) yellowViewController *yellowcon;
@property (strong,nonatomic) blueViewController *bluecon;
@end

@implementation switchViewController
-(IBAction)switchViews:(id)sender{
    [UIView beginAnimations:@"View Flip" context:NULL];
    [UIView setAnimationDuration:0.4];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    if(!self.yellowcon.view.superview){
        if(!self.yellowcon){
            self.yellowcon=[self.storyboard instantiateViewControllerWithIdentifier:@"Yellow"];
        }
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.view cache:false];
        [self.bluecon.view removeFromSuperview];
        [self.view  insertSubview:self.yellowcon.view atIndex:0];
    }else{
        if(!self.bluecon){
            self.bluecon=[self.storyboard instantiateViewControllerWithIdentifier:@"Blue"];
        }
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:false];

        [self.yellowcon.view removeFromSuperview];
        [self.view insertSubview:self.bluecon.view atIndex:0];
    }
    [UIView commitAnimations];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.bluecon=[self.storyboard instantiateViewControllerWithIdentifier:@"Blue"];
    [self.view insertSubview:self.bluecon.view atIndex:0];
    // Do any additional setup after loading the view.
}
-(void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    if(!self.bluecon.view.superview){
        self.bluecon=nil;
    }else{
        self.yellowcon=nil;
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
