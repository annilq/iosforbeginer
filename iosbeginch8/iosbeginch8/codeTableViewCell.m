//
//  codeTableViewCell.m
//  iosbeginch8
//
//  Created by annilq on 2018/11/7.
//  Copyright © 2018年 annilq. All rights reserved.
//

#import "codeTableViewCell.h"

@interface codeTableViewCell()
@property(strong,nonatomic) UILabel *nameLabel;
@property(strong,nonatomic) UILabel *colorLabel;
@end
@implementation codeTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        CGRect nameLabelRect=CGRectMake(0, 10, 125, 21);
        UILabel *nameMarker=[[UILabel alloc] initWithFrame:nameLabelRect];
        nameMarker.text=@"nameFromCode:";
        [self.contentView addSubview:nameMarker];
        
        CGRect colorLabelRect=CGRectMake(0, 39, 125, 21);
        UILabel *colorMarker=[[UILabel alloc] initWithFrame:colorLabelRect];
        colorMarker.text=@"colorFromCode:";
        [self.contentView addSubview:colorMarker];
        
        CGRect nameValueRect=CGRectMake(145, 11, 200, 21);
         _nameLabel=[[UILabel alloc] initWithFrame:nameValueRect];
        [self.contentView addSubview:_nameLabel];
        
        CGRect colorValueRect=CGRectMake(145, 40, 200, 21);
        _colorLabel=[[UILabel alloc] initWithFrame:colorValueRect];
        [self.contentView addSubview:_colorLabel];
    }
    return self;
}
-(void)setName:(NSString *)name{
    self.nameLabel.text=name;
}
-(void)setColor:(NSString *)color{
    self.colorLabel.text=color;
}
@end
