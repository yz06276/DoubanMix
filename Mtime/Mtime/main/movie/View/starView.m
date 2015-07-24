//
//  starView.m
//  Mtime
//
//  Created by Mee Leo on 21/7/15.
//  Copyright (c) 2015年 Mee Leo. All rights reserved.
//

#import "starView.h"

@implementation starView


-(void)awakeFromNib{
    
    [self _creatSubView];
    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        [self _creatSubView];
    }
    return self;
}


-(void)_creatSubView{
    UIImage* yellowImage = [UIImage imageNamed:@"yellow"];
    UIImage* grayImage = [UIImage imageNamed:@"gray"];
    _yellowStarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, yellowImage.size.width*5, yellowImage.size.height)];
    _yellowStarView.backgroundColor = [UIColor colorWithPatternImage:yellowImage];
    _grayStarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, grayImage.size.width*5, grayImage.size.height)];
    _grayStarView.backgroundColor = [UIColor colorWithPatternImage:grayImage];
    self.backgroundColor = [UIColor clearColor];
    [self addSubview:_grayStarView];
    [self addSubview:_yellowStarView];
    
    //放大倍数
    float scale = self.frame.size.height/grayImage.size.height;
    //放大
    _grayStarView.transform = CGAffineTransformMakeScale(scale, scale);
    _yellowStarView.transform = CGAffineTransformMakeScale(scale, scale);
    
    //以上放大是以center为锚点进行放大，所以需要调整位置
    CGRect fitFrame = _grayStarView.frame;
    fitFrame.origin = CGPointZero;
    _grayStarView.frame = fitFrame;
    _yellowStarView.frame = fitFrame;
    
    
    
    
    
}

- (void)setStars:(NSString *)stars{
    _stars = stars;
//    [self _creatSubView];
    [self setNeedsLayout];
    
}

-(void)layoutSubviews{
    [super layoutSubviews];
//    NSLog(@"%@",self.stars);
    NSInteger starsTemp = self.stars.integerValue;
//    NSLog(@"%liaaaaaaaaaaaaaa",(long)starsTemp);
    float width = starsTemp/50.0 * _grayStarView.frame.size.width;
    CGRect frame = _grayStarView.frame;
    frame.size.width = width;
    _yellowStarView.frame = frame;
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
