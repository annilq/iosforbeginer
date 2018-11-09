//
//  FontSizeViewController.m
//  iosbenginch9
//
//  Created by annilq on 2018/11/9.
//  Copyright © 2018年 annilq. All rights reserved.
//

#import "FontSizeViewController.h"

@interface FontSizeViewController ()

@end

@implementation FontSizeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(NSArray *)pointSizes{
    static NSArray *pointSizes=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        pointSizes=@[@9,@10,@11,@12,@13,@14,@18,@24,@36,@48,@64,@72,@96,@144];
    });
    return  pointSizes;
}
-(UIFont *)fontForDisplayAtIndexPath:(NSIndexPath *)indexpath{
    NSNumber *pointsize=self.pointSizes[indexpath.row];
    return [self.font fontWithSize:pointsize.floatValue];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.pointSizes count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId=@"FontNameAndSize";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    cell.textLabel.font=[self fontForDisplayAtIndexPath:indexPath];
    cell.textLabel.text=self.font.fontName;
    cell.detailTextLabel.text=self.font.fontName;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
        UIFont *font=[self fontForDisplayAtIndexPath:indexPath];
        return 25+font.ascender-font.descender;
}

@end
