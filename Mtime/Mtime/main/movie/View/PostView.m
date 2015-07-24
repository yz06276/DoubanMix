//
//  PostView.m
//  Mtime
//
//  Created by Mee Leo on 24/7/15.
//  Copyright (c) 2015年 Mee Leo. All rights reserved.
//

#import "PostView.h"
#import "iCarousel.h"
#define TopViewHeight 136
#define TopViewTop -36
#define TopPostHeight 100
#define TopButtonHeight 36
#define BottomLabelHeight 35
#define BottomLabelTop Swidth-49-BottomLabelHeight





@implementation PostView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    [self _creatTopView];
    
    
    return self;
    
}


-(void)_creatTopView{
    UIView* topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Swidth, TopViewHeight)];
    
    UIButton* topButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, Swidth, TopViewHeight)];
    UIImage* topBtnImg = [UIImage imageNamed:@"indexBG_home"];
    topBtnImg  =  [topBtnImg stretchableImageWithLeftCapWidth:0 topCapHeight:1];
    [topButton setBackgroundImage:topBtnImg forState:UIControlStateNormal];
    topView.backgroundColor = [UIColor redColor];
    [topView addSubview:topButton];
    
    iCarousel* carouselView = [[iCarousel alloc]initWithFrame:CGRectMake(0, 0, Swidth, TopPostHeight)];
    carouselView.delegate = self;
    carouselView.dataSource = self;
    carouselView.type = iCarouselTypeCoverFlow;
    [topView addSubview:carouselView];
    

    [self addSubview:topView];
    
    
    
    
}

-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    
    
    return 100;
}

-(UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    
    if (nil == view) {
        view = [[UIView alloc]initWithFrame:CGRectMake((1-0.16)*Swidth/2, 5, 0.16*Swidth, 90)];
        view.backgroundColor = [UIColor purpleColor];
        
        
        
    }else{
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
