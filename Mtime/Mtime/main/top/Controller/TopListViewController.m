//
//  TopListViewController.m
//  Mtime
//
//  Created by Mee Leo on 17/7/15.
//  Copyright (c) 2015年 Mee Leo. All rights reserved.
//

#import "TopListViewController.h"
#import "MyCollectionViewCell.h"
#import "MovieDetialTableViewController.h"

@interface TopListViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic ,strong) NSMutableArray *movieModelArray;
@property (strong, nonatomic) UICollectionView* collectionView;

@end

@implementation TopListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self _creatCollectionView];
    
    
    // Do any additional setup after loading the view from its nib.
}

//

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)_creatCollectionView{
    UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumInteritemSpacing = 1;
    layout.minimumLineSpacing = 1;
    layout.itemSize = CGSizeMake((Swidth-40)/3, Sheight/3.3);
    
    UICollectionView* collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, Swidth, Sheight) collectionViewLayout:layout];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    
    UINib* nib = [UINib nibWithNibName:@"MyCollectionViewCell" bundle:[NSBundle mainBundle]];
    [collectionView registerNib:nib forCellWithReuseIdentifier:@"topCell"];
    collectionView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:collectionView];
}

-(void)loadData{
    NSString* JsonName = @"top250.json";
    NSString* filePath = [[NSBundle mainBundle]pathForResource:JsonName ofType:nil];
    
    NSData* data = [NSData dataWithContentsOfFile:filePath];
    
    NSMutableDictionary* dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSArray* subjects = dict[@"subjects"];
    self.movieModelArray = [NSMutableArray array];
    for (NSDictionary* dict in subjects) {
        NSDictionary* subject =  dict;
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
    NSLog(@"%@",_movieModelArray);
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 10;
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MyCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"topCell" forIndexPath:indexPath];
    cell.model = _movieModelArray[indexPath.row];
    return cell;
    
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    MovieDetialTableViewController* vc = [[MovieDetialTableViewController alloc]init];
    vc.navigationItem.title = @"电影详情";
//    vc.navigationItem.backBarButtonItem  = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:nil];
    [self.navigationController pushViewController:vc animated:YES];
    
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
