//
//  MoreViewController.h
//  Mtime
//
//  Created by Mee Leo on 17/7/15.
//  Copyright (c) 2015年 Mee Leo. All rights reserved.
//

#import "BaseViewController.h"
#import "SDImageCache.h"
@interface MoreViewController : BaseViewController

@property (strong,nonatomic) UITableView* moreTableView;
@property (strong,nonatomic) UILabel* label;
@property (strong,nonatomic) UILabel* cacheLabel;
@property (nonatomic)float cacheSize;
@property (nonatomic,strong)SDImageCache* cache;

@end
