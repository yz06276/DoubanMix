//
//  NewsWebViewController.m
//  Mtime
//
//  Created by Mee Leo on 27/7/15.
//  Copyright (c) 2015年 Mee Leo. All rights reserved.
//

#import "NewsWebViewController.h"

@interface NewsWebViewController ()

@end

@implementation NewsWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView* webView  = [[UIWebView alloc]initWithFrame:self.view.bounds];
    NSURL* w3cSchoolURL = [NSURL URLWithString:@"http://www.w3schools.com/default.asp"];
    NSURLRequest* requst = [NSURLRequest requestWithURL:w3cSchoolURL];
    [webView loadRequest:requst];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"切换本地/网络WebView" style:UIBarButtonItemStylePlain target:self action:@selector(localWebView)];
    webView.hidden = NO;
    
    NSString* path = [[NSBundle mainBundle]pathForResource:@"test" ofType:@"html"];
    NSString* htmlStr = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    UIWebView* localWebView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    
    
    [localWebView loadHTMLString:htmlStr baseURL:nil];
    
    localWebView.hidden = YES;
    
    _webView = webView;
    _localWebView  = localWebView;
    [self.view addSubview:_webView];
    [self.view addSubview:_localWebView];
    
    // Do any additional setup after loading the view.
}

- (void)localWebView{
    
    _webView.hidden = !_webView.hidden;
    _localWebView.hidden = !_localWebView.hidden;
    
    
    
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
