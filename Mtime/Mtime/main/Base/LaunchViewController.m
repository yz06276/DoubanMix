//
//  LaunchViewController.m
//  Mtime
//
//  Created by Mee Leo on 27/7/15.
//  Copyright (c) 2015年 Mee Leo. All rights reserved.
//

#import "LaunchViewController.h"
#import "MainTabBarViewController.h"

@interface LaunchViewController ()

@end

@implementation LaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _index =0;
    
    [self _creatImageView];
    [self magicCircle];


 

//    self.view.window.rootViewController = vc ;
//    [self magicAnimation];
    
    
    // Do any additional setup after loading the view from its nib.
}

-(void)_creatImageView{
    _imageViewArray = [NSMutableArray array];
    CGFloat Iwidth = Swidth/4;
    CGFloat Iheight = Sheight/7;
    for (NSInteger i = 1; i<29; i++) {
        if (i <= 4 && i >= 1) {
            [self _singalImageView:CGRectMake((i-1)*Iwidth, 0, Iwidth, Iheight) :i];
        }else if (i >= 5 && i <= 10) {
            
            [self _singalImageView:CGRectMake(3*Iwidth, (i-4)*Iheight, Iwidth, Iheight) :i];
        
        }else if(i >= 11 && i <= 13 ){
            
            [self _singalImageView:CGRectMake((13-i)*Iwidth, 6*Iheight, Iwidth, Iheight) :i];
            
        }else if(i >= 14 && i<= 18 ){
            
            [self _singalImageView:CGRectMake(0, (19-i)*Iheight, Iwidth, Iheight) :i];
            
        }else if(i == 19 ){
            
            [self _singalImageView:CGRectMake(Iwidth, Iheight, Iwidth, Iheight) :i];
            
        }else if(i >= 20 && i<= 24 ){
            
            [self _singalImageView:CGRectMake(2*Iwidth, (i-19)*Iheight, Iwidth, Iheight) :i];
            
        }else if(i >= 25 && i<= 28 ){
            
            [self _singalImageView:CGRectMake(Iwidth, (30-i)*Iheight, Iwidth, Iheight) :i];
            
        }

        
    }
    
}

-(UIImageView*) _singalImageView:(CGRect)rect :(NSInteger)i{
    UIImageView* imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%li",i]]];
    imageView.frame = rect;
    imageView.alpha = 0;
    [self.view addSubview:imageView];
    [_imageViewArray addObject:imageView];
    
    return imageView;
    
}

-(void)magicCircle{
    
//    [UIView animateWithDuration:5 delay:5 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
//        
//        ((UIImageView*)_imageViewArray[_index]).alpha = 1;
//    } completion:nil];
    
    [UIView animateWithDuration:0.05 animations:^{
    
        ((UIImageView*)_imageViewArray[_index]).alpha = 1;
    }];
//
       _index++;

    if (_index < 28) {
      [self performSelector:@selector(magicCircle) withObject:nil afterDelay:.05];
    }else {
        [UIView animateWithDuration:1 animations:^{
        MainTabBarViewController* vc = [[MainTabBarViewController alloc]init];
            self.view.window.rootViewController = vc;}];
        
    }
}

//-(void) magicAnimation{
//    CGFloat Iwidth = Swidth/4;
//    CGFloat Iheight = Sheight/7;
//    NSInteger i = 0;
//    for (; i<=4; i++) {
//        [UIView animateWithDuration:2 animations:^{
//            ((UIImageView*)_imageViewArray[i]).frame = CGRectMake((i-1)*Iwidth, 0, Iwidth, Iheight);
//            [UIView setAnimationDelay:2];
//            
//
//
//        }];
//    }
//    
//    
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
