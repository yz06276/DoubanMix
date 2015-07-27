//
//  BigPostCollectionCell.m
//  Mtime
//
//  Created by Mee Leo on 26/7/15.
//  Copyright (c) 2015年 Mee Leo. All rights reserved.
//

#import "BigPostCollectionCell.h"
#import "UIImageView+WebCache.h"
#import "starView.h"

@implementation BigPostCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        CGFloat Fheight = frame.size.height;
        CGFloat Fwidth = frame.size.width;
        CGFloat bigNap = 24.0;
        CGFloat littleNap = 15;
        CGFloat contentWidth =Fwidth-bigNap*2;
        CGFloat contentHeight = Fheight -bigNap*2;
        CGFloat littlePostWidth = contentWidth/2;
        CGFloat littlePostHeight = 8*contentWidth/(2*5.5);
        CGFloat labelX = Fwidth/2+littleNap;
        CGFloat labelWidth = contentWidth-littleNap;
        CGFloat starViewX = bigNap;
        CGFloat starViewY = bigNap +littlePostHeight +40;
        CGFloat starViewWitdh = 0.5* contentWidth;
        CGFloat starViewHeight = 30;
        //在layoutSubView 的时候需要用到一下三个值
        _labelX = labelX;
        _labelY = bigNap;
        _labelWidth = labelWidth;
        
        
        CGRect ZeroXYFrame = CGRectMake(0, 0, Fwidth, Fheight);
        //设置前后两个视图， 两个视图的hidden值相反，实现同时只显示一个点击最上层的button 来用反转动画切换显示前还是后View
        UIView* frontView = [[UIView alloc]initWithFrame:ZeroXYFrame];
        _frontView = frontView;
        UIView* backView = [[UIView alloc]initWithFrame:ZeroXYFrame];
        _backView = backView;
        backView.hidden = YES;
        
        UIImageView* BigPostView = [[UIImageView alloc]initWithFrame:ZeroXYFrame];
        [_frontView addSubview:BigPostView];
        [self addSubview:frontView];
        _bigPostView = BigPostView;
        
        UIImageView* littlePostView = [[UIImageView alloc]initWithFrame:CGRectMake(bigNap, bigNap ,littlePostWidth,littlePostHeight)];
        //一下三个标签可能因为 标签内文字的多少而改变布局，所以这里的frame为zero
        UILabel* original_title     = [[UILabel alloc]initWithFrame:CGRectZero];
        UILabel* title              = [[UILabel alloc]initWithFrame:CGRectZero];
        UILabel* year               = [[UILabel alloc]initWithFrame:CGRectZero];
        starView* star              = [[starView alloc]initWithFrame:CGRectMake(starViewX, starViewY, starViewWitdh, starViewHeight)];
        UILabel* average            = [[UILabel alloc]initWithFrame:CGRectMake(starViewX+starViewWitdh+bigNap+30, starViewY, 80, 40)];

        original_title.textColor = [UIColor whiteColor];
        title.textColor = [UIColor whiteColor];
        year.textColor = [UIColor whiteColor];
        average.textColor = [UIColor whiteColor];
        
        _littlePostView = littlePostView;
        _original_title = original_title;
        _title = title;
        _year = year;
        _star = star;
        _average = average;
        
        [_backView addSubview:littlePostView];
        [_backView addSubview:original_title];
        [_backView addSubview:title];
        [_backView addSubview:year];
        [_backView addSubview:star];
        [_backView addSubview:average];
        [self addSubview:_backView];
        
        UIButton* button = [[UIButton alloc]initWithFrame:ZeroXYFrame];
        button.tag = 1;
        button.backgroundColor = [UIColor clearColor];
        [self addSubview:button];
        [button addTarget: self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        
//        
//        self.movieModel = _movieArray[index];
//        NSDictionary* images = _movieModel.image;
//        NSString* str = images[@"large"];
        
    }
    return self;
}

-(void)btnAction:(UIButton*)btn{
    
    
    [UIView animateWithDuration:1 animations:^{
    
        _frontView.hidden  = !_frontView.hidden;
        _backView.hidden = !_backView.hidden;
    
    }];
    
    
}

-(void)setMovieModel:(MovieModel *)movieModel{
    _movieModel = movieModel;
    [self setNeedsLayout];
}

//-(void)xxx{
//[UIView transitionFromView:<#(UIView *)#> toView:<#(UIView *)#> duration:<#(NSTimeInterval)#> options:<#(UIViewAnimationOptions)#> completion:<#^(BOOL finished)completion#>
//    
//    
//}

    


-(void)layoutSubviews{
    NSDictionary* images = _movieModel.image;
    NSURL* url = [NSURL URLWithString:images[@"large"]];
    
    
    [_bigPostView sd_setImageWithURL:url];
    
    _original_title.text =[NSString stringWithFormat:@"原名:  %@", _movieModel.original_title];
    _title.text = _movieModel.title;
    _year.text = _movieModel.year;
    _star.stars = _movieModel.stars;
    [_littlePostView sd_setImageWithURL:url];
    _average.text = [NSString stringWithFormat:@"%.1f", _movieModel.average];
    
    //计算 英文标签和中文标签的高度，然后决定 各自的布局，在重载的时候生效
    
    CGFloat height1 = [_original_title.text boundingRectWithSize:CGSizeMake(_labelWidth, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18]} context:nil].size.height;
    CGFloat height2 = [_title.text boundingRectWithSize:CGSizeMake(_labelWidth, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18]} context:nil].size.height;
    _original_title.frame = CGRectMake(_labelX, _labelY, _labelWidth, height1);
    _title.frame = CGRectMake(_labelX, _labelY+height1, _labelWidth, height2);
    _year.frame = CGRectMake(_labelX, _labelY+height1+height2, _labelWidth, height2+height1);
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
