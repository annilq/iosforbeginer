//
//  rootViewController.m
//  iosbenginch9
//
//  Created by annilq on 2018/11/9.
//  Copyright © 2018年 annilq. All rights reserved.
//

#import "rootViewController.h"
#import "FavoritesFontList.h"
#import "FontListViewController.h"
@interface rootViewController ()
@property (copy,nonatomic) NSArray *familyNames;
@property (assign,nonatomic) CGFloat cellPointSize;
@property (strong,nonatomic) FavoritesFontList *favoritesList;
@end

@implementation rootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.familyNames=[[UIFont familyNames] sortedArrayUsingSelector:@selector(compare:)];
    UIFont *preferredTableViewFont=[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    self.cellPointSize=preferredTableViewFont.pointSize;
    self.favoritesList=[FavoritesFontList shareFavoritesList];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if([self.favoritesList.favorites count]>0){
        return 2;
    }else{
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section==0){
        return [self.familyNames count];
    }else{
       return  1;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section==0){
        UIFont *font=[self fontForDisplayAtIndexPath:indexPath];
        return 25+font.ascender-font.descender;
    }else{
        return tableView.rowHeight;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *familyCell=@"FamilyName";
    static NSString *fontCell=@"Favorites";
    UITableViewCell *cell;
    if(indexPath.section==0){
        cell=[tableView dequeueReusableCellWithIdentifier:familyCell];
        cell.textLabel.font=[self fontForDisplayAtIndexPath:indexPath];
        cell.textLabel.text=self.familyNames[indexPath.row];
        cell.detailTextLabel.text=self.familyNames[indexPath.row];
    }else{
        cell=[tableView dequeueReusableCellWithIdentifier:fontCell forIndexPath:indexPath];
    }
    return cell;
}
-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(section==0){
        return @"All font family";
    }else{
        return @"favorite Family";
    }
}
-(UIFont *)fontForDisplayAtIndexPath:(NSIndexPath *)indexpath{
    if(indexpath.section==0){
        NSString *familyName=self.familyNames[indexpath.row];
        NSString *fontName=[[UIFont fontNamesForFamilyName:familyName] firstObject];
        return [UIFont fontWithName:fontName size:self.cellPointSize];

    }else{
        return nil;
    }
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSIndexPath *indexpath=[self.tableView indexPathForCell:sender];
    FontListViewController *listVC=segue.destinationViewController;
    if(indexpath.section==0){
        NSString *familyName=self.familyNames[indexpath.row];
        listVC.fontNames=[[UIFont fontNamesForFamilyName:familyName] sortedArrayUsingSelector:@selector(compare:)];
        listVC.navigationItem.title=familyName;
        listVC.showsFavorite=NO;
    }else{
        listVC.fontNames=self.favoritesList.favorites;
        listVC.navigationItem.title=@"Favorites Font";
        listVC.showsFavorite=YES;
    }
}
@end
