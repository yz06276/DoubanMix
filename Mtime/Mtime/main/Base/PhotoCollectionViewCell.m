//
//  PhotoCollectionViewCell.m
//  Mtime
//
//  Created by Mee Leo on 23/7/15.
//  Copyright (c) 2015年 Mee Leo. All rights reserved.
//

#import "PhotoCollectionViewCell.h"

@implementation PhotoCollectionViewCell



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _scrollView = [[PhotoScrollView alloc]initWithFrame:self.bounds];
        
        [self.contentView addSubview:_scrollView];
    }
    return self;
}

- (void)setImageURL:(NSURL *)imageURL{
    _imageURL = imageURL;
    _scrollView.URL = self.imageURL;

}




@end
