//
//  ViewController.m
//  iosbeginch21
//
//  Created by annilq on 2018/11/26.
//  Copyright © 2018年 annilq. All rights reserved.
//

#import "ViewController.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
#import <MobileCoreServices/UTCoreTypes.h>
@interface ViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageview;
@property (weak, nonatomic) IBOutlet UIButton *takePicktureButton;
@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) AVPlayerViewController  *playerView;
@property(strong,nonatomic) UIImage *image;
@property (strong,nonatomic) NSURL *movieUrl;
@property (copy,nonatomic) NSString *lastChosenMediaType;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    if(![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        self.takePicktureButton.hidden=YES;
    }
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self updateDisplay];
}
-(void)updateDisplay{
    if([self.lastChosenMediaType isEqual:(NSString *)kUTTypeImage]){
        self.imageview.image=self.image;
        self.imageview.hidden=NO;
        self.playerView.view.hidden=YES;
    }else if ([self.lastChosenMediaType isEqual:(NSString *)kUTTypeMovie]){
        [self.playerView.view removeFromSuperview];
        self.playerView= [[AVPlayerViewController alloc] init];
        
        AVPlayerItem *item = [[AVPlayerItem alloc]initWithURL:self.movieUrl];
        
        //通过AVPlayerItem创建AVPlayer
        self.player = [[AVPlayer alloc]initWithPlayerItem:item];
        
        //给AVPlayer一个播放的layer层
        AVPlayerLayer *layer = [AVPlayerLayer playerLayerWithPlayer:self.player];
        //设置AVPlayer的填充模式
        layer.videoGravity = AVLayerVideoGravityResize;
        
        [self.view.layer addSublayer:layer];
        
        //设置AVPlayerViewController内部的AVPlayer为刚创建的AVPlayer
        self.playerView.player = self.player;
        
        //关闭AVPlayerViewController内部的约束
        self.playerView.view.translatesAutoresizingMaskIntoConstraints = YES;
        [self.playerView.player play];
        UIView *movieView=self.playerView.view;
        movieView.frame=self.imageview.frame;
        movieView.clipsToBounds=YES;
        [self.view addSubview:movieView];
        self.imageview.hidden=YES;
        
    }
}
-(void)pickMediaFromSource:(UIImagePickerControllerSourceType)sourceType{
    NSArray *mediaTypes=[UIImagePickerController availableMediaTypesForSourceType:sourceType];
    if([UIImagePickerController isSourceTypeAvailable:sourceType]&&[mediaTypes count]>0){
        UIImagePickerController *picker=[[UIImagePickerController alloc]init];
        picker.mediaTypes=mediaTypes;
        picker.delegate=self;
        picker.allowsEditing=YES;
        picker.sourceType=sourceType;
        [self presentViewController:picker animated:YES completion:nil];
    }else{
        UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"提示" message:@"unsupport media type" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleDefault handler:nil];
        UIAlertAction *confirmAction=[UIAlertAction actionWithTitle:@"canfirm" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:cancelAction];
        [alert addAction:confirmAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
}
- (UIImage *)shrikImage:(UIImage *)original toSiz:(CGSize)size{
    UIGraphicsBeginImageContextWithOptions(size, YES, 0);
    CGFloat originalAspect=original.size.width/original.size.height;
    CGFloat targetAspect=size.width/size.height;
    CGRect targetRect;
    if(originalAspect>targetAspect){
        targetRect.size.width=size.width;
        targetRect.size.height=size.height*targetAspect/originalAspect;
        targetRect.origin.x=0;
        targetRect.origin.y=(size.height-targetRect.size.height)*0.5;
    }else if(originalAspect<targetAspect){
        targetRect.size.width=size.width*originalAspect/targetAspect;
        targetRect.size.height=size.height;
        targetRect.origin.x=(size.width-targetRect.size.width)*0.5;
        targetRect.origin.y=0;
    }else{
        targetRect=CGRectMake(0, 0, size.width, size.height);
    }
    [original drawInRect:targetRect];
    UIImage *final=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return final;
}
- (IBAction)shootPictureOrVideo:(UIButton *)sender {
    [self pickMediaFromSource:UIImagePickerControllerSourceTypeCamera];
}
- (IBAction)selectExisingPictureOrVideo:(UIButton *)sender {
    [self pickMediaFromSource:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info{
    self.lastChosenMediaType=info[UIImagePickerControllerMediaType];
    if([self.lastChosenMediaType isEqual:(NSString *)kUTTypeImage]){
        UIImage *chooseImage=info[UIImagePickerControllerEditedImage];
        self.image=[self shrikImage:chooseImage toSiz:self.imageview.bounds.size];
        
    }else if([self.lastChosenMediaType isEqual:(NSString *)kUTTypeMovie]){
        self.movieUrl=info[UIImagePickerControllerMediaURL];
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}
@end
