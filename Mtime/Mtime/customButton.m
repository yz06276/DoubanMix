//
//  customButton.m
//  Mtime
//
//  Created by Mee Leo on 17/7/15.
//  Copyright (c) 2015年 Mee Leo. All rights reserved.
//

#import "customButton.h"

@implementation customButton



- (instancetype)initWithFrame:(CGRect)frame withImageName:(NSString *)imageName withTitle:(NSString *)title
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.imageView             = [[UIImageView alloc]initWithFrame:CGRectZero];
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.imageView.image       = [UIImage imageNamed:imageName];

        [self addSubview:_imageView];

        _label                     = [[UILabel alloc]initWithFrame:CGRectZero];
        _label.text                = title;
        _label.font                = [UIFont systemFontOfSize:12];
        _label.textAlignment       = NSTextAlignmentCenter;
        _label.textColor           = [UIColor lightGrayColor];
        [self addSubview:self.label];

    }
    return self;
}

-(void)layoutSubviews{
    _imageView.frame = CGRectMake((self.frame.size.width-20)/2, 5, 20, 20);
        _label.frame = CGRectMake(0, CGRectGetMaxY(self.imageView.frame), Swidth/5, 19);
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
