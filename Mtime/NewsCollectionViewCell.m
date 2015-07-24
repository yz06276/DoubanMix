//
//  NewsCollectionViewCell.m
//  Mtime
//
//  Created by Mee Leo on 23/7/15.
//  Copyright (c) 2015年 Mee Leo. All rights reserved.
//

#import "NewsCollectionViewCell.h"
#import "UIImageView+WebCache.h"
@implementation NewsCollectionViewCell

- (void)awakeFromNib {
    _imageView.layer.cornerRadius = 10;
    _imageView.layer.borderWidth = 1;
    _imageView.layer.borderColor = [UIColor clearColor].CGColor;
    _imageView.layer.masksToBounds = YES;
}
-(void)setUrl:(NSURL *)url{
    _url = url;
    [self setNeedsLayout];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [self.imageView sd_setImageWithURL:_url];
    
}

@end
