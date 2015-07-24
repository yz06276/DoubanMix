//
//  BigPostCollectionView.m
//  Mtime
//
//  Created by Mee Leo on 24/7/15.
//  Copyright (c) 2015年 Mee Leo. All rights reserved.
//

#import "BigPostCollectionView.h"
#import "UIImageView+WebCache.h"
@implementation BigPostCollectionView

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
        [self addSubview:collectionView];
    }
    return self;
}



-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return self.movieArray.count;
}

-(UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    
    
    NSDictionary* dict = _movieArray[index];
    NSDictionary* images = dict[@"image"];
    NSString* str = images[@"large"];

    if (nil == view) {
        
        view = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 0.7*Swidth, 0.6*Sheight)];
        view.backgroundColor = [UIColor greenColor];
        [((UIImageView*)view) sd_setImageWithURL:[NSURL URLWithString:str]];
        
//        NSLog(@"%@",[dict objectForKey:@"large"]);
        
    }
    else{
        
        [((UIImageView*)view) sd_setImageWithURL:[NSURL URLWithString:str]];
        view.backgroundColor = [UIColor yellowColor];
        
//        NSLog(@"%@",[dict objectForKey:@"large"]);


    }
    return view;
}

-(CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    
    if (option == iCarouselOptionSpacing) {
        return value*1.2;
    }
    return value;
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
