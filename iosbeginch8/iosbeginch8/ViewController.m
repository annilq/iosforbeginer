//
//  ViewController.m
//  iosbeginch8
//
//  Created by annilq on 2018/11/6.
//  Copyright © 2018年 annilq. All rights reserved.
//

#import "ViewController.h"
#import "codeTableViewCell.h"
#import "nibTableViewCell.h"
static NSString *cellIdA=@"cellIdA";
static NSString *cellIdB=@"cellIdB";

@interface ViewController ()

@property (strong,nonatomic) NSDictionary *names;
@property (strong,nonatomic) NSArray *keys;
/*  UISearchDisplayController is deprecated in iOS 8. (Note that UISearchDisplayDelegate is also deprecated.) To manage the presentation of a search bar and display search results in iOS 8 and later, instead use UISearchController.
 */
@property (strong, nonatomic) UISearchController *searchController;

@end

@implementation ViewController
{
    NSMutableArray *filterdName;
    UITableView *table;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *path=[[NSBundle mainBundle] pathForResource:@"sortednames" ofType:@"plist"];
    self.names=[NSDictionary dictionaryWithContentsOfFile:path];
    self.keys=[[self.names allKeys] sortedArrayUsingSelector:@selector(compare:)];
    table=(id)[self.view viewWithTag:1];
    //    cellA style
    [table registerClass:[codeTableViewCell class] forCellReuseIdentifier:cellIdA];
    //    cellA style
    UINib *nib=[UINib nibWithNibName:@"nibTableViewCell" bundle:nil];
    [table registerNib:nib forCellReuseIdentifier:cellIdB];
    
    table.rowHeight=65;
    if(table.style==UITableViewStylePlain){
        UIEdgeInsets contentInset=table.contentInset;
        contentInset.top=20;
        table.contentInset=contentInset;
    }
    filterdName=[[NSMutableArray alloc] init];
    table.tableHeaderView = self.searchController.searchBar;

}
-(UISearchController *)searchController{
    if(_searchController==nil){
        _searchController=[[UISearchController alloc] initWithSearchResultsController:nil];
        //搜索时，背景变暗色
        _searchController.dimsBackgroundDuringPresentation = NO;
        //搜索时，背景变模糊
        _searchController.obscuresBackgroundDuringPresentation = NO;
        //隐藏导航栏
        _searchController.hidesNavigationBarDuringPresentation = NO;
        
        _searchController.delegate = self;
        _searchController.searchResultsUpdater= self;
    }
    return _searchController;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if(!self.searchController.active){
        return [self.keys count];
    }else{
        return 1;
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSString *key=self.keys[section];
    if(!self.searchController.active){
        return [self.names[key] count];
    }else{
        return [filterdName count];
    }
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(!self.searchController.active){
        return self.keys[section];
    }else{
        return nil;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSMutableString *data;
    NSString *key=self.keys[indexPath.section];
    if(!self.searchController.active){
        NSArray *names=self.names[key];
        data =names[indexPath.row];
    }else{
        data =filterdName[indexPath.row];
    }
    if(indexPath.row%2==0){
        codeTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdA forIndexPath:indexPath];
        cell.name=key;
        cell.color=data;
         return cell;
    }else{
        nibTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdB forIndexPath:indexPath];
        cell.nameLable.text=key;
        cell.colorLable.text=data;
        return cell;
    }
}
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)table{
    return self.keys;
}
-(void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    NSString *searchString = [self.searchController.searchBar text];
    NSPredicate *preicate = [NSPredicate predicateWithBlock:^BOOL(NSString *names, NSDictionary *bindings) {
        NSRange range=[names rangeOfString:searchString options:NSCaseInsensitiveSearch];
        return range.location!=NSNotFound;
    }];
    if (filterdName!= nil) {
        [filterdName removeAllObjects];
    }
    for(NSString *key in self.keys){
        NSArray *match=[self.names[key] filteredArrayUsingPredicate:preicate];
        [filterdName addObjectsFromArray:match];
    }
    [table reloadData];
}
@end
