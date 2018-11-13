//
//  ViewController.m
//  iosbeginch10
//
//  Created by annilq on 2018/11/13.
//  Copyright © 2018年 annilq. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.sections=@[@{@"header":@"First witch",@"content":@"this is my first a a  a  a  a a a a sdadfsafsafa fdffsdaf fasfdffsa "},@{@"header":@"second witch",@"content":@"this is my b b b b b b b "},@{@"header":@"third witch",@"content":@"this is my c c c c c c c cc "},@{@"header":@"four witch",@"content":@"this is my first"},@{@"header":@"fivth witch",@"content":@"this is my first"},@{@"header":@"siexed witch",@"content":@"this is my first"},@{@"header":@"siexed witch",@"content":@"this is my first"},@{@"header":@"siexed witch",@"content":@"this is my first"},@{@"header":@"siexed witch",@"content":@"this is my first"}];
    // Do any additional setup after loading the view, typically from a nib.
    [self.collectionView registerClass:[ContentCell class] forCellWithReuseIdentifier:@"content"];
    [self.collectionView registerClass:[HeaderCell class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    self.collectionView.backgroundColor=[UIColor whiteColor];
    UIEdgeInsets contentInset=self.collectionView.contentInset;
    contentInset.top=20;
    [self.collectionView setContentInset:contentInset];
    UICollectionViewLayout *layout=self.collectionView.collectionViewLayout;
    UICollectionViewFlowLayout *flow=(UICollectionViewFlowLayout *)layout;
    flow.sectionInset=UIEdgeInsetsMake(10, 20, 30, 20);
    flow.headerReferenceSize=CGSizeMake(100,25);
}
-(NSArray *)wordsInSection:(NSInteger)section{
    NSString *content=self.sections[section][@"content"];
    NSCharacterSet *space=[NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSArray *words=[content componentsSeparatedByCharactersInSet:space];
    return words;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return [self.sections count];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSArray *words=[self wordsInSection:section];
    return [words count];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *words=[self wordsInSection:indexPath.section];
    ContentCell *cell=[self.collectionView dequeueReusableCellWithReuseIdentifier:@"content" forIndexPath:indexPath];
    cell.text=words[indexPath.row];
    return cell;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *words=[self wordsInSection:indexPath.section];
    CGSize size=[ContentCell sizeForContentString:words[indexPath.row]];
    return size;
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if([kind isEqual:UICollectionElementKindSectionHeader]){
        HeaderCell *cell=[self.collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
        cell.text=self.sections[indexPath.section][@"header"];
        return cell;
    }
    return nil;
}
@end
