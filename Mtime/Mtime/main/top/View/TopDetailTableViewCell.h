//
//  TableViewCell.h
//  Mtime
//
//  Created by Mee Leo on 28/7/15.
//  Copyright (c) 2015年 Mee Leo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChatModel.h"

@interface TopDetailTableViewCell : UITableViewCell

@property (strong,nonatomic)ChatModel* chatModel;
@property (strong, nonatomic) IBOutlet UIImageView *userImageView;

@property (strong, nonatomic) IBOutlet UIImageView *backImageView;
@property (strong, nonatomic) IBOutlet UILabel *nickName;
@property (strong, nonatomic) IBOutlet UILabel *content;
@property (strong, nonatomic) IBOutlet UILabel *rating;

@end
