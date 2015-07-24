//
//  MainTabBarViewController.m
//  Mtime
//
//  Created by Mee Leo on 17/7/15.
//  Copyright (c) 2015年 Mee Leo. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "customButton.h"
#import "BaseViewController.h"
#import "BaseNavigationController.h"
#import "MovieViewController.h"
#import "NewsViewController.h"
#import "TopListViewController.h"
#import "CinemaViewController.h"
#import "MoreViewController.h"


@interface MainTabBarViewController ()
@property (nonatomic,strong) UIImageView* seletedImage;
@end

@implementation MainTabBarViewController



- (void)viewDidLoad {
    [super viewDidLoad];

    [self creatNaviController];
    [self _setTabBar];
/*
//要先创建NaviVC 然后才能自定义TabBar ，顺序如果电脑会导致下面的TabBar上的item点不动。
 这是因为，我们在这里在创建setTabBar的时候先移除了现有的UITabBarButton，然后改成自己的，
 如果我们先开始添加tabBar 会导致之后在添加controllers 的时候系统会再搞五个覆盖上去，
 就是把我们想要删除的button 又创建回去了，并且那玩意是在顶层的。所以这里必须先创建controllers
 此时下面会有五个空白的button，之后我们的删除函数会生效，然后替换为我们自己的。
 */
    // Do any additional setup after loading the view.
}

- (void)_setTabBar{

        //移除原有的button
    self.tabBar.translucent = YES;
    
    for (UIView* subView in self.tabBar.subviews) {

        Class cls = NSClassFromString(@"UITabBarButton");//从一个 字符串的名字,  获得对应类的 类对象,(类也是一个对象)
        if ([subView  isKindOfClass:cls]) {
            [subView removeFromSuperview];
            }
    }
    //设置背景
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tab_bg_all"]];
    UIImageView* seletedImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, Swidth/5, 50)];
    seletedImage.image = [UIImage imageNamed:@"selectTabbar_bg_all1"];
    self.seletedImage = seletedImage;
    
    [self.tabBar addSubview:seletedImage];
    
    
    //添加自己的button 对象
    NSArray* imageNames = @[@"movie_home",@"msg_new",@"start_top250",@"icon_cinema",@"more_setting"];
    NSArray* titles = @[@"电影",@"新闻",@"top250",@"影院",@"更多"];
    
    for (NSInteger i = 0; i < 5; i++) {
        CGRect frame = CGRectMake(i*Swidth/5, 0, Swidth/5, 44);
        customButton* btn = [[customButton alloc]initWithFrame:frame withImageName:imageNames[i] withTitle:titles[i]];
        btn.tag = i;
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.tabBar addSubview:btn];
    }
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)btnAction:(customButton*)btn{
    self.selectedIndex = btn.tag; //这句话不能加到动画里，否则会发生在切换视图的时候，顶部一闪一闪。
    [UIView animateWithDuration:0.3 animations:^{
        self.seletedImage.center = btn.center;
    }];
   
}

- (void)creatNaviController{
    
    NSArray* VCArray = @[[[MovieViewController alloc]init],[[NewsViewController alloc]init],[[TopListViewController alloc]init],[[CinemaViewController alloc]init],[[MoreViewController alloc]init]];//这里面我懒省事 ，直接把创建好的五个VC塞进数组了
    NSArray* titleArray = @[@"电影",@"新闻",@"Top100",@"影院",@"更多"];
    NSMutableArray* naviArray = [NSMutableArray array];
    for (NSInteger i = 0; i<5; i++) {
        BaseNavigationController* navi = [[BaseNavigationController alloc]initWithRootViewController:VCArray[i]];
        [VCArray[i] navigationItem].title = titleArray[i]; //修改对应Navi的title的时候，需要修改其对应的rootVC才有效，并且这种写法优化后，可以直接向数组里拿出来的东西发消息。
        [naviArray addObject:navi];
        
    }
    
    self.viewControllers = naviArray; //记住这里的是ViewControllers

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
