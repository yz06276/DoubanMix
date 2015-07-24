//
//  PostView.m
//  Mtime
//
//  Created by Mee Leo on 24/7/15.
//  Copyright (c) 2015年 Mee Leo. All rights reserved.
//

#import "PostView.h"
#import "iCarousel.h"
#import "UIImageView+WebCache.h"
#import "UIViewExt.h"
#define TopViewHeight 136
#define TopViewTop -36
#define TopPostHeight 100
#define TopButtonHeight 36
#define BottomLabelHeight 35
#define BottomLabelTop Swidth-49-BottomLabelHeight





@implementation PostView

-(instancetype)initWithFrame:(CGRect)frame WithArray:(NSArray*)movieArray{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.movieArray = movieArray;
        [self _creatTopView];
        
        

    }
    
    
    return self;
    
}


-(void)_creatTopView{
    UIView* topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Swidth, TopViewHeight)];
    
    UIButton* topButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, Swidth, TopViewHeight)];
    UIImage* topBtnImg = [UIImage imageNamed:@"indexBG_home"];
    topBtnImg  =  [topBtnImg stretchableImageWithLeftCapWidth:0 topCapHeight:1];
    [topButton setBackgroundImage:topBtnImg forState:UIControlStateNormal];
//    topView.backgroundColor = [UIColor redColor];
    [topButton addTarget:self action:@selector(topButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:topButton];
    
    iCarousel* carouselView = [[iCarousel alloc]initWithFrame:CGRectMake(0, 0, Swidth, TopPostHeight)];
    carouselView.stopAtItemBoundary = YES;
    carouselView.delegate = self;
    carouselView.dataSource = self;
    carouselView.type = iCarouselTypeCoverFlow;
    [topView addSubview:carouselView];
    

    [self addSubview:topView];
    
    
    
    
}

-(void)topButtonAction{
    
    [self MovieSelf];
    
    
}

-(void)MovieSelf{
    
    if (self.top < 0 ) {
        [UIView animateWithDuration:0.3 animations:^{
            self.coverView.hidden = NO;
            self.top = 64;

        }];
    }else{
        [UIView animateWithDuration:0.3 animations:^{
            self.coverView.hidden = YES;
            self.top = -36;
            
        }];
    }
    
}

-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    
    
    return self.movieArray.count;
}

-(UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    self.movieModel = _movieArray[index];
    NSDictionary* images = _movieModel.image;
    NSString* str = images[@"medium"];
    
    if (nil == view) {
        view = [[UIImageView alloc]initWithFrame:CGRectMake((1-0.16)*Swidth/2, 5, 0.16*Swidth, 100)];
        [((UIImageView*)view) sd_setImageWithURL:[NSURL URLWithString:str]];
        view.backgroundColor = [UIColor purpleColor];
        
        
        
    }else{
        view = [[UIImageView alloc]initWithFrame:CGRectMake((1-0.16)*Swidth/2, 5, 0.16*Swidth, 90)];
        [((UIImageView*)view) sd_setImageWithURL:[NSURL URLWithString:str]];

        view.backgroundColor = [UIColor orangeColor];
        
    }
    
    return view;
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    if (option == iCarouselOptionSpacing)
    {
        return value * 5;
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
