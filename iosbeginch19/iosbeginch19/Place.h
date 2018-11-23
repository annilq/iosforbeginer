//
//  Place.h
//  iosbeginch19
//
//  Created by annilq on 2018/11/23.
//  Copyright © 2018年 annilq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@interface Place : NSObject<MKAnnotation>
@property(copy,nonatomic) NSString *title;
@property(copy,nonatomic)NSString *subtitle;
@property(assign,nonatomic)CLLocationCoordinate2D coordinate;

@end

