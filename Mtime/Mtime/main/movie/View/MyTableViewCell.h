//
//  MyTableViewCell.h
//  Mtime
//
//  Created by Mee Leo on 20/7/15.
//  Copyright (c) 2015年 Mee Leo. All rights reserved.
//

#import "MovieModel.h"
#import "starView.h"
@interface MyTableViewCell : UITableViewCell


@property (nonatomic,strong)MovieModel* movieModel;
@property (strong, nonatomic) IBOutlet starView *star;

@property (strong, nonatomic) IBOutlet UIImageView *post;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *year;
@property (strong, nonatomic) IBOutlet UILabel *rate;

@end
