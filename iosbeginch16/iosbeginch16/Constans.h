//
//  Constans.h
//  iosbeginch16
//
//  Created by annilq on 2018/11/21.
//  Copyright © 2018年 annilq. All rights reserved.
//

#ifndef Constans_h
#define Constans_h
typedef NS_ENUM(NSInteger,ShapeType){
    kLineShape=0,
    kRectShape,
    kEllipseShape,
    kImageShape
};
typedef NS_ENUM(NSInteger,ColorTabIndex){
    kRedColorTab=0,
    kBlueColorTab,
    kYellowColorTab,
    kGreenColorTab,
    kRandomColorTab
};
#define degressToRadian(x)(M_PI*(x)180.0)
#endif /* Constans_h */
