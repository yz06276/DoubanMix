//
//  BaseNavigationController.m
//  Mtime
//
//  Created by Mee Leo on 17/7/15.
//  Copyright (c) 2015年 Mee Leo. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Helvetica-Bold" size:18.0],NSFontAttributeName,[UIColor whiteColor], NSForegroundColorAttributeName,nil]];  直接改nav字体和颜色
    [self.navigationBar setBarStyle:UIBarStyleBlack];  //这个工程Navi的背景是黑的,但是navi上的title字体颜色并不能改, 有三种方法可以修改,一种是 navigationItemTitleView 直接自己贴一个自己的View上去,还可以直接修改, 或者在用黑色背景的时候我们把NavigationBar的barStyle修改成黑色,这样字体就呈现出白色了
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg_all-64"] forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.translucent = YES;
    // Do any additional setup after loading the view from its nib.
}
- (UIStatusBarStyle)preferredStatusBarStyle{  //这个函数返回的就是
//  return   [self.topViewController preferredStatusBarStyle];
    
    return UIStatusBarStyleLightContent;
    
    //如果父类重写了这个玩意，那么子类即使再重写这个函数也不会生效，除非你自己调用一下，也就是让第一句生效，这里的第一个return是写不写都可以的，如果在子控制器中需要让他生效，需要加上第一个return
}

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
