//
//  PhotoCollectionView.m
//  Mtime
//
//  Created by Mee Leo on 23/7/15.
//  Copyright (c) 2015年 Mee Leo. All rights reserved.
//

#import "PhotoCollectionView.h"
#import "PhotoCollectionViewCell.h"


@implementation PhotoCollectionView



- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        
        self.dataSource = self;
        self.delegate = self;
        [self registerClass:[PhotoCollectionViewCell class] forCellWithReuseIdentifier:@"photoCell"];
        self.backgroundColor = [UIColor redColor];
        self.pagingEnabled = YES;
    
    }

    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _imageURLArray.count;
    
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    PhotoCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"photoCell" forIndexPath:indexPath];
    cell.imageURL = _imageURLArray[indexPath.row];
    return cell;
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
