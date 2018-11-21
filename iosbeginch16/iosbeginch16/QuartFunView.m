//
//  QuartFunView.m
//  iosbeginch16
//
//  Created by annilq on 2018/11/21.
//  Copyright © 2018年 annilq. All rights reserved.
//

#import "QuartFunView.h"
#import "UIColor+Random.h"
@implementation QuartFunView
//将storyboard里面UIViewController的view设置成该UIview，以便加载此试图,并且会调用下面的方法
-(id)initWithCoder:(NSCoder *)aDecoder{
    if(self=[super initWithCoder: aDecoder]){
        _currentColor=[UIColor redColor];
        _useRandomColor=NO;
        _drawImage=[UIImage imageNamed:@"iphone.png"];
    }
    return self;
}
-(CGRect)currentRect{
    return CGRectMake(self.firstTouchLocation.x, self.firstTouchLocation.y, self.lastTouchLcation.x-self.firstTouchLocation.x, self.lastTouchLcation.y-self.firstTouchLocation.y);
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, self.currentColor.CGColor);
    CGContextSetFillColorWithColor(context, self.currentColor.CGColor);
    switch (self.shapeType) {
        case kLineShape:
            CGContextMoveToPoint(context, self.firstTouchLocation.x, self.firstTouchLocation.y);
            CGContextAddLineToPoint(context, self.lastTouchLcation.x, self.lastTouchLcation.y);
            CGContextStrokePath(context);
            break;
            
        case kRectShape:
            CGContextAddRect(context, self.currentRect);
            CGContextDrawPath(context, kCGPathStroke);
            break;
            
        case kEllipseShape:
            CGContextAddEllipseInRect(context, self.currentRect);
            CGContextDrawPath(context,kCGPathStroke);
            break;
        case kImageShape:{
            CGFloat horizontalOffset=self.drawImage.size.width/2;
            CGFloat verticalOffset=self.drawImage.size.height/2;
            CGPoint drawPoint=CGPointMake(self.lastTouchLcation.x-horizontalOffset, self.lastTouchLcation.y-verticalOffset);
            [self.drawImage drawAtPoint:drawPoint];
            break;
        }
        default:
            break;
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if(self.useRandomColor){
        self.currentColor=[UIColor randomColor];
    }
    UITouch *touch=[touches anyObject];
    self.firstTouchLocation=[touch locationInView:self];
    self.lastTouchLcation=[touch locationInView:self];
    [self setNeedsDisplay];
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch=[touches anyObject];
    self.lastTouchLcation=[touch locationInView:self];
    if(self.shapeType==kImageShape){
        CGFloat horizontalOffset=self.drawImage.size.width/2;
        CGFloat verticalOffset=self.drawImage.size.height/2;
        self.redrawRect=CGRectUnion(self.redrawRect,CGRectMake(self.lastTouchLcation.x-horizontalOffset, self.lastTouchLcation.y-verticalOffset,self.drawImage.size.width,self.drawImage.size.height));
    }else{
        self.redrawRect=CGRectUnion(self.redrawRect, self.currentRect);
    }
    self.redrawRect=CGRectInset(self.redrawRect, -2.0, -2.0);
    [self setNeedsDisplayInRect:self.redrawRect];
    
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch=[touches anyObject];
    self.lastTouchLcation=[touch locationInView:self];
    if(self.shapeType==kImageShape){
        CGFloat horizontalOffset=self.drawImage.size.width/2;
        CGFloat verticalOffset=self.drawImage.size.height/2;
        self.redrawRect=CGRectUnion(self.redrawRect,CGRectMake(self.lastTouchLcation.x-horizontalOffset, self.lastTouchLcation.y-verticalOffset,self.drawImage.size.width,self.drawImage.size.height));
    }else{
        self.redrawRect=CGRectUnion(self.redrawRect, self.currentRect);
    }
    self.redrawRect=CGRectInset(self.redrawRect, -2.0, -2.0);
    [self setNeedsDisplayInRect:self.redrawRect];
}
@end
