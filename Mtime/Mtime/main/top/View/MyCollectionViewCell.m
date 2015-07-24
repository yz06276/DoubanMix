//
//  MyCollectionViewCell.m
//  Mtime
//
//  Created by Mee Leo on 21/7/15.
//  Copyright (c) 2015年 Mee Leo. All rights reserved.
//

#import "MyCollectionViewCell.h"
#import "MovieModel.h"
#import "UIImageView+WebCache.h"

@implementation MyCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setModel:(MovieModel *)model{
    _model = model;
    [self setNeedsDisplay];
}

-(id)valueForUndefinedKey:(NSString *)key{

    return nil;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    _title.text = _model.title;
    _average.text = [NSString stringWithFormat:@"%.1f",_model.average];
    _title.backgroundColor = [UIColor blackColor];
    _title.alpha = 0.5;
    NSString* imageURL = _model.image[@"medium"];
    [_postIcon sd_setImageWithURL:[NSURL URLWithString:imageURL]];
    _starView.stars = _model.stars;
    
}

@end
