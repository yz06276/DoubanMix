//
//  NewsViewController.m
//  Mtime
//
//  Created by Mee Leo on 17/7/15.
//  Copyright (c) 2015年 Mee Leo. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsTableViewCell.h"
#import "newsModel.h"
#import "UIViewExt.h"
#import "UIImageView+WebCache.h"
#import "NewsDetialControllerViewController.h"
#import "NewsWebViewController.h"

@interface NewsViewController () <UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

@property (nonatomic,strong)NSMutableArray* newsListArray;
@property (nonatomic,strong)UITableView* newsTableView;
@property (nonatomic,strong)UIImageView* headScrollView;

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatNewsModel];
    [self _creatNewsTableView];
    [self _creatScrollView];

    
    
    // Do any additional setup after loading the view from its nib.
}
-(void)_creatScrollView{
//    UIImageView* headImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, Swidth, 200)];
    
    
    
    UIScrollView* headScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, Swidth, 200)];
    headScrollView.backgroundColor = [UIColor redColor];
    headScrollView.contentSize = CGSizeMake(2*Swidth, 200);
    headScrollView.pagingEnabled = YES;
    headScrollView.showsVerticalScrollIndicator = NO;
//    headScrollView.contentMode = UIViewContentModeScaleToFill;
    UIImageView* headImage1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, Swidth, 200)];
    newsModel* model2 = self.newsListArray[1];
//    [headImage1 sd_setImageWithURL:[NSURL URLWithString:model1.image ]];
    [headImage1 setImage:[UIImage imageNamed:@"1"]];
    [headScrollView addSubview:headImage1];
    UIImageView* headImage2 = [[UIImageView alloc]initWithFrame:CGRectMake(Swidth, 0, Swidth, 200)];
    
    [headImage2 sd_setImageWithURL:[NSURL URLWithString:model2.image]];
    [headScrollView addSubview:headImage2];
//    self.headScrollView = headScrollView;
    UIView* view = [[UIView alloc]initWithFrame:CGRectMake(0, 64, Swidth, 200)];
    [view addSubview:headImage1];
    [self.view addSubview:headImage1];
    self.headScrollView = headImage1;
    
    
}

-(void) _creatNewsTableView{
    
    UITableView* newsTableView  = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Swidth, Sheight) style:UITableViewStylePlain];
    
    newsTableView.dataSource = self;
    newsTableView.delegate = self;
    self.newsTableView = newsTableView;
    UINib* newsCellNib = [UINib nibWithNibName:@"NewsTableViewCell" bundle:[NSBundle mainBundle]];
    
    [newsTableView registerNib:newsCellNib forCellReuseIdentifier:@"newsCell"];
    [self.view addSubview:newsTableView];
}


-(NSArray*)readJsonFromLocal:(NSString*)JsonName{
    NSString* filePath = [[NSBundle mainBundle]pathForResource:JsonName ofType:nil];
    
    NSData* data = [NSData dataWithContentsOfFile:filePath];
    
    NSArray* dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    return dict;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.newsListArray count]-2;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NewsTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"newsCell"forIndexPath:indexPath];
    cell.newsModel = _newsListArray[indexPath.row+2];
       return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 70;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    tableView.tableHeaderView.backgroundColor = [UIColor clearColor];
    return 200.0;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    newsModel* newsModel = _newsListArray[indexPath.row+1];
    
    if (newsModel.type == 0) {
        NewsWebViewController* webVC = [[NewsWebViewController alloc]init];
        [self.navigationController pushViewController:webVC animated:YES ];

    }else{
    
        NewsDetialControllerViewController* news = [[NewsDetialControllerViewController alloc]init];
        news.newsModel = self.newsListArray[indexPath.row +1];
        [self.navigationController pushViewController:news animated:YES];
        
    }
   
    
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIImageView* headImage1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, Swidth, 200)];
    
    return headImage1;
    
    
}
-(void)creatNewsModel{
    
    NSArray* newsArray = [self readJsonFromLocal:@"news_list.json"];
    self.newsListArray = [NSMutableArray array];
    for (NSDictionary* dict in newsArray) {
        newsModel* model = [[newsModel alloc]init];
        model.image = dict[@"image"];
        model.summary = dict[@"summary"];
        model.title = dict[@"title"];
        model.type = [dict[@"type"]integerValue];
        [self.newsListArray addObject:model];
    }
}



- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offY = scrollView.contentOffset.y;
    
    if(offY>-64){
        
        _headScrollView.top = -offY;
    
    }
    else{
        
        CGFloat newHeight = ABS(offY)-64+200;
        CGFloat newWidth = Swidth/200*newHeight;
        
        _headScrollView.frame = CGRectMake((Swidth-newWidth)/2, 64, newWidth, newHeight);
        
    }
    
    
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
