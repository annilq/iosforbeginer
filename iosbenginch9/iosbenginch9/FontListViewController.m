//
//  FontListViewController.m
//  iosbenginch9
//
//  Created by annilq on 2018/11/9.
//  Copyright © 2018年 annilq. All rights reserved.
//

#import "FontListViewController.h"
#import "FavoritesFontList.h"
#import "FontSizeViewController.h"
#import "FontInfoViewController.h"
@interface FontListViewController ()
@property (assign,nonatomic) CGFloat cellFontSize;
@end

@implementation FontListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIFont *preferredTableViewFont=[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    self.cellFontSize=preferredTableViewFont.pointSize;
    if(self.showsFavorite){
        self.navigationItem.rightBarButtonItem=self.editButtonItem;
    }
}
-(UIFont *)fontForDisplayAtIndexPath:(NSIndexPath *)indexpath{
    NSString *fontName=self.fontNames[indexpath.row];
    return [UIFont fontWithName:fontName size:self.cellFontSize];
}
-(void)viewWillAppear:(BOOL)animated{
    if(self.showsFavorite){
        self.fontNames=[FavoritesFontList shareFavoritesList].favorites;
        [self.tableView reloadData];
    }
}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.fontNames count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* cellId=@"FontName";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    cell.textLabel.font=[self fontForDisplayAtIndexPath:indexPath];
    cell.textLabel.text=self.fontNames[indexPath.row];
    cell.detailTextLabel.text=self.fontNames[indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section==0){
        UIFont *font=[self fontForDisplayAtIndexPath:indexPath];
        return 25+font.ascender-font.descender;
    }else{
        return tableView.rowHeight;
    }
}
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.showsFavorite;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if(!self.showsFavorite){
        return;
    }
    if(editingStyle==UITableViewCellEditingStyleDelete){
        NSString *fontName=self.fontNames[indexPath.row];
        [[FavoritesFontList shareFavoritesList] removeFavorite:fontName];
        self.fontNames=[FavoritesFontList shareFavoritesList].favorites;
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    [[FavoritesFontList shareFavoritesList] moveInteAtIndex:sourceIndexPath.row toIndex:destinationIndexPath.row ];
    self.fontNames=[FavoritesFontList shareFavoritesList].favorites;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSIndexPath *indexpath=[self.tableView indexPathForCell:sender];
    UIFont *font=[self fontForDisplayAtIndexPath:indexpath];
    [segue.destinationViewController navigationItem].title=font.fontName;
    if([segue.identifier isEqualToString:@"ShowFontSize"]){
        FontSizeViewController *sizeVC=segue.destinationViewController;
        sizeVC.font=font;
    }else if([segue.identifier isEqualToString:@"ShowFontInfo"]){
        FontInfoViewController *infoVC=segue.destinationViewController;
        infoVC.font=font;
        infoVC.favorite=[[FavoritesFontList shareFavoritesList].favorites containsObject:font.fontName];
    }
}
@end
