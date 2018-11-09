//
//  FavoritesFontList.m
//  iosbenginch9
//
//  Created by annilq on 2018/11/9.
//  Copyright © 2018年 annilq. All rights reserved.
//

#import "FavoritesFontList.h"
@interface FavoritesFontList()
@property (strong,nonatomic) NSMutableArray *favorites;
@end

@implementation FavoritesFontList
+(instancetype)shareFavoritesList{
    static FavoritesFontList *shared=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        shared=[[self alloc] init];
    });
    return shared;
}
-(instancetype)init{
    self=[super init];
    if(self){
        NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
        NSArray *storedFavorites=[defaults objectForKey:@"favorites"];
        if(storedFavorites){
            self.favorites=[storedFavorites mutableCopy];
        }else{
            self.favorites=[NSMutableArray array];
        }
    }
    return self;
}
-(void)addFavorite:(id)item{
    [_favorites insertObject:item atIndex:0];
    [self saveFavorites];
}
-(void)removeFavorite:(id)item{
    [_favorites removeObject:item];
    [self saveFavorites];
}
-(void)moveInteAtIndex:(NSInteger)from toIndex:(NSInteger)to{
    id item =_favorites[from];
    [_favorites removeObjectAtIndex:from];
    [_favorites insertObject:item atIndex:to];
    [self saveFavorites];
}
-(void)saveFavorites{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults setObject:self.favorites forKey:@"favorites"];
    [defaults synchronize];
}
@end
