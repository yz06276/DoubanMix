//
//  MovieViewController.m
//  Mtime
//
//  Created by Mee Leo on 17/7/15.
//  Copyright (c) 2015年 Mee Leo. All rights reserved.
//

#import "MovieViewController.h"
#import "MovieModel.h"
#import "MyTableViewCell.h"

@interface MovieViewController () <UICollectionViewDelegateFlowLayout,UITableViewDataSource>  //这个flowlayout 里面已经包含了delegat 协议， 所以就省了

@property (nonatomic,strong)UITableView* movieTableView;
@property (nonatomic,strong)UIView* postView;
@property (nonatomic,strong)NSMutableArray* movieModelArray;

@end

@implementation MovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _creatCustomNavi];
    [self _creatMovieTableView];
    [self _creatMovieModel];
    
        
    
    
//     Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Creat

- (void)_creatCustomNavi{
    UIView* flipView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 30)]; //Rect的尺寸要和图片相匹配，否则在不设置填充模式的时候，如果设置的太高就会导致北京图片靠上。因为添加到导航栏的时候， 系统是按图层的center来放的
    
    UIButton* naviButton1 = [UIButton buttonWithType:UIButtonTypeCustom]; //新语法，自定义的无样式自定义button,尺寸大小会自动装下子视图
    [naviButton1 setImage:[UIImage imageNamed:@"list_home"] forState:UIControlStateNormal];
    [naviButton1 setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home"] forState:UIControlStateNormal];
    [naviButton1 sizeToFit];
    naviButton1.tag = 1;
    [naviButton1 addTarget:self action:@selector(flipAction:) forControlEvents:UIControlEventTouchUpInside];
    [flipView addSubview:naviButton1];
    
    UIButton* naviButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [naviButton2 setImage:[UIImage imageNamed:@"poster_home"] forState:UIControlStateNormal];
    [naviButton2 setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home"] forState:UIControlStateNormal];
    [naviButton2 sizeToFit];
    [naviButton2 addTarget:self action:@selector(flipAction:) forControlEvents:UIControlEventTouchUpInside];
    naviButton2.tag = 2;
    naviButton2.hidden = YES;  //初始化两个按钮的时候要一个隐藏，一个显示
    [flipView addSubview:naviButton2];
    
    UIBarButtonItem* naviItem = [[UIBarButtonItem alloc]initWithCustomView:flipView]; //记得不要把不是UIbarButtonItem的东西放在navigationItem上；
    self.navigationItem.rightBarButtonItem = naviItem;

    
}

- (void)_creatMovieTableView{
    
    UITableView* movieTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Swidth, Sheight) style:UITableViewStylePlain]; //如果上面的stateBar 有设置不透明的时候， y坐标要从0开始
    movieTableView.dataSource = self;
    movieTableView.delegate = self;
    movieTableView.hidden = YES;
    UINib* cellNib = [UINib nibWithNibName:@"MyTableViewCell" bundle:[NSBundle mainBundle]];
    [movieTableView registerNib:cellNib forCellReuseIdentifier:@"cell2"];
    [self.view addSubview: movieTableView];
    self.movieTableView = movieTableView;
    movieTableView.backgroundColor = [UIColor clearColor];
    self.movieTableView.allowsSelection = NO;
    

    
    
}

-(void)_creatPostView{

    
}

- (void)_creatMovieModel{
    NSMutableDictionary* basedict = [self readJsonFromLocal:@"us_box.json"];
    NSArray* subjects = basedict[@"subjects"];
    self.movieModelArray = [NSMutableArray array];
    for (NSDictionary* dict in subjects) {
        NSDictionary* subject = dict[@"subject"];
        MovieModel* model = [[MovieModel alloc]init];
        model.title = [subject objectForKey:@"title"];
        model.original_title = [subject objectForKey:@"original_title"];
        model.image = [subject objectForKey:@"images"];
        NSNumber* average = [[subject objectForKey:@"rating"]objectForKey:@"average"];
        model.average = [average floatValue];
        model.year = [subject objectForKey:@"year"];
        model.original_title = [subject objectForKey:@"original_title"];
        model.stars = [[subject objectForKey:@"rating"]objectForKey:@"stars"];
        [_movieModelArray addObject:model];
    }
}
#pragma  mark - Action
- (void)flipAction:(UIButton*)btn{
    UIView* flipView = self.navigationItem.rightBarButtonItem.customView;
    UIButton* btn1 = (UIButton*)[flipView viewWithTag:1];
    UIButton* btn2 = (UIButton*)[flipView viewWithTag:2];
//    
    
    [self flipView:flipView isFromRight:btn2.hidden]; //通过判断btn2的隐藏情况来实现控制左右循环反转
    [self flipView:self.view isFromRight:btn2.hidden];
    
    btn1.hidden = !btn1.hidden;
    btn2.hidden = !btn2.hidden;
    _movieTableView.hidden = !_movieTableView.hidden;

}

#pragma mark - Tools



- (void)flipView:(UIView*)view isFromRight:(BOOL)isFromRight{
        UIViewAnimationOptions option =  isFromRight?UIViewAnimationOptionTransitionFlipFromRight:UIViewAnimationOptionTransitionFlipFromLeft;
    [UIView transitionWithView:view duration:0.7 options:option animations:nil completion:nil];

}

-(NSMutableDictionary*)readJsonFromLocal:(NSString*)JsonName{
    NSString* filePath = [[NSBundle mainBundle]pathForResource:JsonName ofType:nil];
    
    NSData* data = [NSData dataWithContentsOfFile:filePath];
    
    NSMutableDictionary* dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    return dict;
    
}

#pragma mark - TableViewDelegate&Datasource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 11;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MyTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell2" forIndexPath:indexPath];
    cell.movieModel = _movieModelArray[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
    
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