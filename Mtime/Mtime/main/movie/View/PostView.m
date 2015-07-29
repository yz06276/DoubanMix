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

#pragma mark - init方法
//重写了init 并且增加了一个传入的参数， 所以这里要将这个函数暴露给.h文件，要不然 其他类看不到
-(instancetype)initWithFrame:(CGRect)frame WithArray:(NSArray*)movieArray{
    self = [super initWithFrame:frame];  //所有的init 都应该先调用父类的init
    if (self) {
        
        self.movieArray = movieArray;
        [self _creatTopView];

    }

    return self;

}

#pragma mark - 视图创建
-(void)_creatTopView{

    //顶层的海报视图中，最底层都是按钮，按钮的图片 按素材顶部的1像素拉伸出来，然后放海报的View视图
    UIButton* topButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, Swidth, TopViewHeight)];
    UIImage* topBtnImg  = [UIImage imageNamed:@"indexBG_home"];
    topBtnImg           = [topBtnImg stretchableImageWithLeftCapWidth:0 topCapHeight:1];
    [topButton setBackgroundImage:topBtnImg forState:UIControlStateNormal];
//    topView.backgroundColor = [UIColor redColor];
    [topButton addTarget:self action:@selector(topButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:topButton];//先添加button
    
    iCarousel* carouselView = [[iCarousel alloc]initWithFrame:CGRectMake(0, 0, Swidth, TopPostHeight)];
    _littlePostView = carouselView;
    carouselView.stopAtItemBoundary = YES;
    carouselView.delegate = self;
    carouselView.dataSource = self;
    carouselView.type = iCarouselTypeCoverFlow;
    [self addSubview:carouselView]; //后添加carouseView
    

//    [self addSubview:topView];
    
    
    
    
}

#pragma mark - Action & 重用方法
-(void)topButtonAction{
    
    [self MovieSelf];

}

-(void)MovieSelf{ //控制自己上下移动
    
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

#pragma mark - iCarousel.delegat & dataSourse

-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    
    
    return self.movieArray.count;
}

-(UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    self.movieModel = _movieArray[index];
    NSDictionary* images = _movieModel.image;
    NSString* str = images[@"medium"];
    
    if (nil == view) {
        view                 = [[UIImageView alloc]initWithFrame:CGRectMake((1-0.16)*Swidth/2, 5, 0.16*Swidth, 100)];
        [((UIImageView*)view) sd_setImageWithURL:[NSURL URLWithString:str]];
        view.backgroundColor = [UIColor purpleColor];
        
        
        
    }else{
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
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
