//
//  CinemaViewController.h
//  Mtime
//
//  Created by Mee Leo on 17/7/15.
//  Copyright (c) 2015年 Mee Leo. All rights reserved.
//

#import "BaseViewController.h"

@interface CinemaViewController : BaseViewController

@property (strong,nonatomic)NSDictionary* cinemaJsonDict;

@property (strong,nonatomic)NSDictionary*districtJsonDict;

@property (strong,nonatomic)NSMutableArray* cinemaModelArray;

@property (strong,nonatomic)NSMutableArray* districtModelArray;

@property(strong,nonatomic)UITableView* tableView;
@end
