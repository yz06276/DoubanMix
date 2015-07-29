//
//  TableViewCell.h
//  Mtime
//
//  Created by Mee Leo on 27/7/15.
//  Copyright (c) 2015年 Mee Leo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CinemaModel.h"

@interface TableViewCell : UITableViewCell

@property (strong,nonatomic)CinemaModel* cinemaModel;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *address;
@property (strong, nonatomic) IBOutlet UIImageView *isSeatSupport;
@property (strong, nonatomic) IBOutlet UIImageView *isCouponSupport;
@property (strong, nonatomic) IBOutlet UILabel *grade;
@property (strong, nonatomic) IBOutlet UILabel *lowPrice;
@property (strong, nonatomic) IBOutlet UILabel *distance;

@end
