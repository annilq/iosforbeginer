//
//  DetailViewController.m
//  iosbeginch11
//
//  Created by annilq on 2018/11/14.
//  Copyright © 2018年 annilq. All rights reserved.
//

#import "DetailViewController.h"
#import "LanguageListController.h"
@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)configureView {
    // Update the user interface for the detail item.
    NSURL *url=[NSURL URLWithString:self.detailItem];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.languageButton=[[UIBarButtonItem alloc] initWithTitle:@"choose lang" style:UIBarButtonItemStylePlain target:self action:@selector(toggleLanguage:)];
    self.navigationItem.rightBarButtonItem=self.languageButton;
    [self configureView];
}
-(void)setLanguageString:(NSString *)newString{
    if(![newString isEqualToString:self.languageString]){
        _languageString=[newString copy];
        self.detailItem=modifyUrlForLanguage(_detailItem, _languageString);
    }
    if(self.languagePopoverController!=nil){
        [self.languagePopoverController dismissViewControllerAnimated:YES completion:nil];
        self.languagePopoverController=nil;
    }
}
-(void)toggleLanguage:(id) sender{
    if(self.languagePopoverController==nil){
        LanguageListController *lanCon=[[LanguageListController alloc] init];
        lanCon.detailViewController=self;
//        lanCon.modalPresentationStyle=UIModalPresentationPopover;
        lanCon.modalPresentationStyle                   = UIModalPresentationPopover;
        lanCon.popoverPresentationController.barButtonItem = self.languageButton;
        [self presentViewController:lanCon animated:YES completion:nil];
        self.languagePopoverController=lanCon;
    }else{
        if(self.languagePopoverController!=nil){
            [self.languagePopoverController dismissViewControllerAnimated:YES completion:nil];
            self.languagePopoverController=nil;
        }
    }
}


#pragma mark - Managing the detail item

- (void)setDetailItem:(NSString *)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = modifyUrlForLanguage(newDetailItem, self.languageString);
        // Update the view.
        [self configureView];
    }
}
static NSString *modifyUrlForLanguage(NSString *url,NSString *lang){
    if(!lang){
        return url;
    }
    NSRange codeRanage=NSMakeRange(7, 2);
    if([[url substringWithRange:codeRanage] isEqualToString:lang]){
        return url;
    }else{
        NSString *newUrl=[url stringByReplacingCharactersInRange:codeRanage withString:lang];
        return newUrl;
    }
}

@end
