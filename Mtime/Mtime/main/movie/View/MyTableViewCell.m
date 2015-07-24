//
//  MyTableViewCell.m
//  Mtime
//
//  Created by Mee Leo on 20/7/15.
//  Copyright (c) 2015年 Mee Leo. All rights reserved.
//

#import "MyTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "starView.h"

@implementation MyTableViewCell

- (void)awakeFromNib {
    // Initialization code

    
}

- (void)setMovieModel:(MovieModel *)movieModel{
    _movieModel = movieModel;
    [self setNeedsLayout];
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    self.backgroundColor = [UIColor clearColor];
    _title.text = _movieModel.title;
    _year.text = _movieModel.year;
    _rate.text = [NSString stringWithFormat:@"%.1f",_movieModel.average];
        NSString* imageURL = _movieModel.image[@"medium"];
        [_post sd_setImageWithURL:[NSURL URLWithString:imageURL]];

    _star.stars = _movieModel.stars;
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
