//
//  ViewController.m
//  iosbeginch15
//
//  Created by annilq on 2018/11/19.
//  Copyright © 2018年 annilq. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak,nonatomic) IBOutlet UIButton *startBtn;
@property (weak,nonatomic) IBOutlet UITextView *resultTextView;
@property (weak,nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(NSString *)fetchSomethingFromServer{
    [NSThread sleepForTimeInterval:1];
    return @"hi there";
}
-(NSString *)processData:(NSString *)data{
    [NSThread sleepForTimeInterval:2];
    return [data uppercaseString];
}

-(NSString *)calculateFirstResult:(NSString *)data{
    [NSThread sleepForTimeInterval:3];
    return [NSString stringWithFormat:@"Number of char %lu",(unsigned long)[data length]];
}

-(NSString *)calculateSecondResult:(NSString *)data{
    [NSThread sleepForTimeInterval:4];
    return [data stringByReplacingOccurrencesOfString:@"E" withString:@"e"];
}
-(IBAction)doWork:(id)sender{
    NSDate *startTime=[NSDate date];
    self.startBtn.enabled=NO;
    [self.spinner startAnimating];
    dispatch_queue_t queue=dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        NSString *fetchedData=[self fetchSomethingFromServer];
        NSString *processDatd=[self processData:fetchedData];
        __block NSString *firstResult;
        __block NSString *secondResult;
        dispatch_group_t group=dispatch_group_create();
        dispatch_group_async(group, queue, ^{
             firstResult=[self calculateFirstResult:processDatd];
        });
        dispatch_group_async(group, queue, ^{
             secondResult=[self calculateSecondResult:processDatd];
        });
        dispatch_group_notify(group, queue, ^{
            NSString *resultSummary=[NSString stringWithFormat:@"First:[%@]\n second:[%@]",firstResult,secondResult];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.resultTextView.text=resultSummary;
                [self.spinner stopAnimating];
                self.startBtn.enabled=YES;
            });
            NSDate *endTime=[NSDate date];
            NSLog(@"completed in %f seconds",[endTime timeIntervalSinceDate:startTime]);
        });
    });
}
@end
