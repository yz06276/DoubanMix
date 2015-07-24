
//
//  PhotoScrollView.m
//  Mtime
//
//  Created by Mee Leo on 23/7/15.
//  Copyright (c) 2015年 Mee Leo. All rights reserved.
//

#import "PhotoScrollView.h"
#import "UIImageView+WebCache.h"

@implementation PhotoScrollView 

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc]initWithFrame:self.bounds];
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_imageView];
        self.maximumZoomScale = 2;
        self.minimumZoomScale = 1;
        self.delegate = self;
        
        UITapGestureRecognizer* doubleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(_doubleTap)];
        doubleTap.numberOfTapsRequired = 2;
        doubleTap.numberOfTouchesRequired = 1;
        [self addGestureRecognizer:doubleTap];
        
        
    }
    return self;
}
- (void)_doubleTap{
    if (self.zoomScale != 1) {
        [self setZoomScale:1 animated:YES];
    }else{
    [self setZoomScale:2 animated:YES];
    }
}

-(void)setURL:(NSURL *)URL{
    _URL = URL;
    [self setNeedsLayout];
    
}



-(void)layoutSubviews{
    
    [_imageView sd_setImageWithURL:_URL];
    
    
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    
    return _imageView;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
