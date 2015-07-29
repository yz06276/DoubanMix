//
//  BigPostCollectionView.m
//  Mtime
//
//  Created by Mee Leo on 24/7/15.
//  Copyright (c) 2015年 Mee Leo. All rights reserved.
//

#import "BigPostCollectionView.h"
#import "UIImageView+WebCache.h"
#import "BigPostCollectionCell.h"
@implementation BigPostCollectionView
#pragma mark - init方法

//重构了 init方法， 必须暴露给.h ，在.h 里面声明，才能紧跟着alloc 调用
- (instancetype)initWithFrame:(CGRect)frame WithArray:(NSArray*)movieArray
{
    
    
    self = [super initWithFrame:frame];
    if (self) {
        self.movieArray = movieArray;
//        self.backgroundColor = [UIColor clearColor];
        iCarousel* collectionView = [[iCarousel alloc]initWithFrame:CGRectMake(0, 0, Swidth, Sheight-149-35)];
        collectionView.type = iCarouselTypeWheel;
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.ignorePerpendicularSwipes = YES;
        [self addSubview:collectionView];
        _bigPostView = collectionView;
        
    }
    return self;
}

#pragma mark - iCarousel.delegat & dataSourse



-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return self.movieArray.count;
}

-(UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    
    
    self.movieModel = _movieArray[index];
    

    if (nil == view) {
        
        view = [[BigPostCollectionCell alloc]init];
        
        
        view = [[BigPostCollectionCell alloc]initWithFrame:CGRectMake(0, 0, 0.7*Swidth, 0.6*Sheight)];
        ((BigPostCollectionCell*)view).movieModel = _movieArray[index];

//        view.backgroundColor = [UIColor greenColor];

    }else{
        
        ((BigPostCollectionCell*)view).movieModel = _movieArray[index];

//        view.backgroundColor = [UIColor yellowColor];

    }
    return view;
}

-(CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    
    if (option == iCarouselOptionSpacing) {
        return value*1.2;
    }
    return value;
    
}


//-(void)carouselDidScroll:(iCarousel *)carousel{
//    
//    self.currentIndex = carousel.currentItemIndex;
//    
//}

-(void)carouselDidEndScrollingAnimation:(iCarousel *)carousel{
    self.currentIndex = carousel.currentItemIndex;

    
}
//因为iCarouse 是默认同时支持点击和scroll,  使用上下两个标注的会出现点击不能同步,或者互相死循环观察.

//-(void)carouselDidEndDecelerating:(iCarousel *)carousel{
//    
//    self.currentIndex = carousel.currentItemIndex;
//    
//    
//}

    


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
