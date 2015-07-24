//
//  CinemaViewController.m
//  Mtime
//
//  Created by Mee Leo on 17/7/15.
//  Copyright (c) 2015年 Mee Leo. All rights reserved.
//

#import "CinemaViewController.h"

@interface CinemaViewController ()

@end

@implementation CinemaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UIStatusBarStyle)preferredStatusBarStyle{  //这个函数返回的就是
//      return   [self.topViewController preferredStatusBarStyle];
    
    return UIStatusBarStyleLightContent;
    
    //如果父类重写了这个玩意，那么子类即使再重写这个函数也不会生效,其他的我现阶段搞不清楚 http://my.oschina.net/shede333/blog/304560
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
