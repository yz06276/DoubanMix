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
    //这个函数会在 从nib文件创建好view之后执行
    self.backgroundColor = [UIColor clearColor];

    
}

- (void)setMovieModel:(MovieModel *)movieModel{
    _movieModel = movieModel;
    [self setNeedsLayout]; //每个Cell被赋值的时候  设置需要重新载入
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    _title.text        = _movieModel.title;
    _year.text         = _movieModel.year;
    _rate.text         = [NSString stringWithFormat:@"%.1f",_movieModel.average];
    NSString* imageURL = _movieModel.image[@"medium"];
    [_post sd_setImageWithURL:[NSURL URLWithString:imageURL]];
    _star.stars        = _movieModel.stars;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
