//
//  NewsTableViewCell.h
//  Mtime
//
//  Created by Mee Leo on 21/7/15.
//  Copyright (c) 2015年 Mee Leo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "newsModel.h"

@interface NewsTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *newsIcon;
@property (strong, nonatomic) IBOutlet UIImageView *isHaveImage;
@property (strong, nonatomic) IBOutlet UILabel *newsTitle;
@property (strong, nonatomic) IBOutlet UILabel *newsOverview;
@property (strong, nonatomic) newsModel* newsModel;

@end
