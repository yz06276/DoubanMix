//
//  BigPostCollectionView.h
//  Mtime
//
//  Created by Mee Leo on 24/7/15.
//  Copyright (c) 2015年 Mee Leo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"
#import "MovieModel.h"
@interface BigPostCollectionView : UIView <iCarouselDelegate,iCarouselDataSource>

@property (strong,nonatomic) MovieModel* movieModel;
@property (strong,nonatomic) NSArray* movieArray;
@property (nonatomic) NSInteger currentIndex;
@property (nonatomic,strong)iCarousel* bigPostView;
- (instancetype)initWithFrame:(CGRect)frame WithArray:(NSArray*)movieArray;

@end
