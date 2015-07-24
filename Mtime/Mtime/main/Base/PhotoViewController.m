//
//  PhotoViewController.m
//  Mtime
//
//  Created by Mee Leo on 23/7/15.
//  Copyright (c) 2015年 Mee Leo. All rights reserved.
//

#import "PhotoViewController.h"

@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self _creatNavi];
    
    
    
    // Do any additional setup after loading the view.
}

//- (void)_creatCollectionView{
//    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc]init];
//    flowLayout.itemSize = self.view.bounds.size;
//    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//    
//    self.collectionView = [[PhotoCollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
//    self.collectionView.imageURLArray = self.imageURLArray;
//    
//}

-(void)setImageURLArray:(NSArray *)imageURLArray{
    _imageURLArray = imageURLArray;
    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = self.view.bounds.size;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    
    self.collectionView = [[PhotoCollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    [self.view addSubview:_collectionView];

    [self.collectionView setBackgroundColor:[UIColor clearColor]];
    self.collectionView.imageURLArray = self.imageURLArray;
    

}

- (void)_creatNavi{
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelAction)];
    
}

- (void)cancelAction{
    [self dismissViewControllerAnimated:YES completion:nil];
    
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
