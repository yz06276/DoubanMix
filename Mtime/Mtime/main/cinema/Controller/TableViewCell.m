//
//  TableViewCell.m
//  Mtime
//
//  Created by Mee Leo on 27/7/15.
//  Copyright (c) 2015年 Mee Leo. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setCinemaModel:(CinemaModel *)cinemaModel{
    
    _cinemaModel = cinemaModel;
    [self setNeedsLayout];
    
}
-(void)layoutSubviews{
    
    _name.text = _cinemaModel.name;
    _address.text = _cinemaModel.address;
    _isSeatSupport.hidden = _cinemaModel.isSeatSupport;
    _isCouponSupport.hidden = _cinemaModel.isCouponSupport;
    _grade.text = _cinemaModel.grade;
    _lowPrice.text = _cinemaModel.lowPrice;
    _distance.text = @"2048KM";

}

@end
