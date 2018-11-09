//
//  FontInfoViewController.m
//  iosbenginch9
//
//  Created by annilq on 2018/11/9.
//  Copyright © 2018年 annilq. All rights reserved.
//

#import "FontInfoViewController.h"
#import "FavoritesFontList.h"
@interface FontInfoViewController ()
@property (weak,nonatomic) IBOutlet UILabel *fontSampleLabel;
@property (weak,nonatomic) IBOutlet UISlider *fontSizeSlider;
@property (weak,nonatomic) IBOutlet UILabel *fontSizeLabel;
@property (weak,nonatomic) IBOutlet UISwitch *favoriteSwitch;
@end

@implementation FontInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.fontSampleLabel.font=self.font;
    self.fontSampleLabel.text=@"AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVv"
    "WwXxYyZz 0123456789";
    self.fontSizeSlider.value=self.font.pointSize;
    self.fontSizeLabel.text=[NSString stringWithFormat:@"%.0f",self.font.pointSize];
    self.favoriteSwitch.on=self.favorite;
}
-(IBAction)sliderFontSize:(UISlider *)slider{
    float newSize=roundf(slider.value);
    self.fontSampleLabel.font=[self.font fontWithSize:newSize];
    [self.fontSampleLabel sizeToFit];
    self.fontSizeLabel.text=[NSString stringWithFormat:@"%.0f",newSize];
}
-(IBAction)toggleFavorite :(UISwitch *) sender{
    FavoritesFontList *favoriteList=[FavoritesFontList shareFavoritesList];
    if(sender.on){
        [favoriteList addFavorite:self.font.fontName];
    }else{
        [favoriteList removeFavorite:self.font.fontName];
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
