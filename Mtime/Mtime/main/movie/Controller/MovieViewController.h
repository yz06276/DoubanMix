//
//  MovieViewController.h
//  Mtime
//
//  Created by Mee Leo on 17/7/15.
//  Copyright (c) 2015年 Mee Leo. All rights reserved.
//

#import "BaseViewController.h"
#import "PostView.h"
#import "BigPostCollectionView.h"

@interface MovieViewController : BaseViewController

@property(strong,nonatomic)UILabel* bottomTitleLabel;
@property(strong,nonatomic)PostView* littlePostView;
@property(strong,nonatomic)BigPostCollectionView* bigPostView;

@end
