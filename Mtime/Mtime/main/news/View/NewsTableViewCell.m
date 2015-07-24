//
//  NewsTableViewCell.m
//  Mtime
//
//  Created by Mee Leo on 21/7/15.
//  Copyright (c) 2015年 Mee Leo. All rights reserved.
//

#import "NewsTableViewCell.h"
#import "UIImageView+WebCache.h"


@implementation NewsTableViewCell


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setNewsModel:(newsModel *)newsModel{
    _newsModel = newsModel; //self.newsModel 其实是 调用了set方法，如果我在这里再调用set 就会无限递归
    [self setNeedsLayout];
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    _newsTitle.text = _newsModel.title ;
        [_newsIcon sd_setImageWithURL:[NSURL URLWithString:_newsModel.image]];
    _newsOverview.text = _newsModel.summary;

    
    
}


@end
