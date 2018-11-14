//
//  LanguageListController.m
//  iosbeginch11
//
//  Created by annilq on 2018/11/14.
//  Copyright © 2018年 annilq. All rights reserved.
//

#import "LanguageListController.h"
#import "DetailViewController.h"

@implementation LanguageListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.languageNames=@[@"English",@"Franch",@"German",@"Spanish",@"Chinese"];
    self.languageCodes=@[@"en",@"fr",@"de",@"es",@"zh"];
    self.clearsSelectionOnViewWillAppear=NO;
    self.preferredContentSize=CGSizeMake(320.0, [self.languageCodes count]*44.0);
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.languageCodes count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text=self.languageNames[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.detailViewController.languageString=self.languageCodes[indexPath.row];
}
@end
