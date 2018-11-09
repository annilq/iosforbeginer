//
//  FavoritesFontList.h
//  iosbenginch9
//
//  Created by annilq on 2018/11/9.
//  Copyright © 2018年 annilq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FavoritesFontList : NSObject

+(instancetype)shareFavoritesList;
-(NSArray *)favorites;
-(void)addFavorite:(id)item;
-(void)removeFavorite:(id)item;
-(void)moveInteAtIndex:(NSInteger)from toIndex:(NSInteger)to;

@end
