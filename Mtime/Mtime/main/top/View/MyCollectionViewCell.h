//
//  MyCollectionViewCell.h
//  Mtime
//
//  Created by Mee Leo on 21/7/15.
//  Copyright (c) 2015年 Mee Leo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieModel.h"
#import "starView.h"

@interface MyCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *postIcon;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *average;

@property (strong, nonatomic) IBOutlet starView *starView;

@property (strong, nonatomic) MovieModel* model;

@end
