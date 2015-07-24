//
//  NewsDetialControllerViewController.m
//  Mtime
//
//  Created by Mee Leo on 22/7/15.
//  Copyright (c) 2015年 Mee Leo. All rights reserved.
//

#import "NewsDetialControllerViewController.h"
#import "NewsCollectionViewCell.h"
#import "PhotoViewController.h"
#import "BaseNavigationController.h"

@interface NewsDetialControllerViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,strong)NSMutableArray* imageUrlArray;

@end

@implementation NewsDetialControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.minimumLineSpacing = 10;
    flowLayout.minimumInteritemSpacing = 1;
    
    flowLayout.itemSize = CGSizeMake((Swidth-60)/5, (Swidth-60)/5);
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    UICollectionView* newsCollection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, Swidth, Sheight) collectionViewLayout:flowLayout];
    newsCollection.backgroundColor = [UIColor clearColor];
    newsCollection.dataSource = self;
    newsCollection.delegate = self;
//    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 20, 10);
    
    self.newsCollectionView = newsCollection;

    
    NSString* filePath = [[NSBundle mainBundle]pathForResource:@"image_list.json" ofType:nil];
    
    NSData* data = [NSData dataWithContentsOfFile:filePath];
    
    NSMutableArray* images = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSMutableArray* imageURLArray = [NSMutableArray array];
    for (NSDictionary* dict in images) {
        NSURL* url = dict[@"image"];
        [imageURLArray addObject:url];
    }
    self.imageUrlArray = imageURLArray;
 
    UINib* nib = [UINib nibWithNibName:@"NewsCollectionViewCell" bundle:[NSBundle mainBundle]];
    [self.newsCollectionView registerNib:nib forCellWithReuseIdentifier:@"CellB"];
    [self.view addSubview:newsCollection];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    
    return [_imageUrlArray count];
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NewsCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellB" forIndexPath:indexPath];
    if (cell == nil) {
        NSLog(@"1111");
    }
    cell.url = self.imageUrlArray[indexPath.row];
    return cell;
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    PhotoViewController* vc = [[PhotoViewController alloc]init];
    vc.imageURLArray = _imageUrlArray;
    BaseNavigationController* navi = [[BaseNavigationController alloc]initWithRootViewController:vc];
    NSLog(@"1123");
    [self presentViewController:navi animated:YES completion:nil];
    
    
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
