//
//  ViewController.m
//  iosbeginch18
//
//  Created by annilq on 2018/11/23.
//  Copyright © 2018年 annilq. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
{
    CGFloat scale,previousScale;
    CGFloat rotate,previousRotate;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UISwipeGestureRecognizer *vertical=[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(reportVerticalSwipe:)];
    vertical.direction=UISwipeGestureRecognizerDirectionUp|UISwipeGestureRecognizerDirectionDown;
    [self.swipeView addGestureRecognizer:vertical];
    
    UISwipeGestureRecognizer *hortizonal=[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(reportHorizotalSwipe:)];
    hortizonal.direction=UISwipeGestureRecognizerDirectionLeft|UISwipeGestureRecognizerDirectionRight;
    [self.swipeView addGestureRecognizer:hortizonal];
    
    
    UITapGestureRecognizer *singletap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doSingletap:)];
    singletap.numberOfTapsRequired=1;
    [self.tapView addGestureRecognizer:singletap];
    
    UITapGestureRecognizer *doubletap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doDoubletap:)];
    doubletap.numberOfTapsRequired=2;
    [singletap requireGestureRecognizerToFail:doubletap];
    [self.tapView addGestureRecognizer:doubletap];
    
    previousScale=1;
    UIPinchGestureRecognizer *pinchGesture=[[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(doPinch:)];
    pinchGesture.delegate=self;
    [self.image addGestureRecognizer:pinchGesture];
    
    
    UIRotationGestureRecognizer *rotateGesture=[[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(doRotate:)];
    rotateGesture.delegate=self;
    [self.image addGestureRecognizer:rotateGesture];

}
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}
-(void)doPinch:(UIPinchGestureRecognizer *)recognizer{
    scale=recognizer.scale;
    [self transFormImageView];
    if(recognizer.state==UIGestureRecognizerStateEnded){
        previousScale=scale*previousScale;
        scale=1;
    }
}
-(void)doRotate:(UIRotationGestureRecognizer *)recognizer{
    rotate=recognizer.rotation;
    [self transFormImageView];
    if(recognizer.state==UIGestureRecognizerStateEnded){
        previousRotate=rotate+previousRotate;
        rotate=0;
    }}
-(void)transFormImageView{
    CGAffineTransform t=CGAffineTransformMakeScale(scale*previousScale, scale*previousScale);
    t=CGAffineTransformRotate(t, rotate+previousRotate);
    self.image.transform=t;
}
-(void)doSingletap:(UIGestureRecognizer *)recognizer{
    self.tapLabel.text=@"single tap~~~~";
}

-(void)doDoubletap:(UIGestureRecognizer *)recognizer{
    self.tapLabel.text=@"double tap~~~~";

}
-(void)reportVerticalSwipe:(UIGestureRecognizer *)recognizer{
    self.label.text=@"Horizontal swipe detect";
    [self performSelector:@selector(easeText) withObject:nil afterDelay:2];
}
-(void)reportHorizotalSwipe:(UIGestureRecognizer *)recognizer{
    self.label.text=@"veriztical swipe detect";
    [self performSelector:@selector(easeText) withObject:nil afterDelay:2];
}
-(void)easeText{
    self.label.text=@"";
}
@end
