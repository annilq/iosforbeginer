//
//  QuartFunView.h
//  iosbeginch16
//
//  Created by annilq on 2018/11/21.
//  Copyright © 2018年 annilq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constans.h"

@interface QuartFunView : UIView
@property (assign,nonatomic) CGPoint firstTouchLocation;
@property (assign,nonatomic) CGPoint lastTouchLcation;
@property (assign,nonatomic) ShapeType shapeType ;
@property (assign,nonatomic) BOOL useRandomColor;
@property (strong,nonatomic) UIColor *currentColor;
@property (strong,nonatomic) UIImage *drawImage;
@property (readonly,nonatomic) CGRect currentRect;
@property (assign,nonatomic) CGRect redrawRect;
@end

