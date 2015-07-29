//
//  TableViewCell.m
//  Mtime
//
//  Created by Mee Leo on 28/7/15.
//  Copyright (c) 2015年 Mee Leo. All rights reserved.
//

#import "TopDetailTableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation TopDetailTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.backgroundColor = [UIColor clearColor];
    _backImageView.layer.cornerRadius = 10;
    _backImageView.layer.borderWidth = 1;
    _backImageView.layer.backgroundColor = [UIColor clearColor].CGColor;
    _backImageView.layer.masksToBounds = YES;
    
    _userImageView.layer.cornerRadius = 10;
    _userImageView.layer.borderWidth = 1;
    _userImageView.layer.backgroundColor = [UIColor whiteColor].CGColor;
    _userImageView.layer.masksToBounds = YES;
    
    
   /*
    _imageView.layer.cornerRadius = 10;
    _imageView.layer.borderWidth = 1;
    _imageView.layer.borderColor = [UIColor clearColor].CGColor;
    _imageView.layer.masksToBounds = YES;
    */
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    
    
    
    // Configure the view for the selected state
}

-(void)setChatModel:(ChatModel *)chatModel{
    _chatModel = chatModel;
    [self setNeedsLayout];
    
}

-(void)layoutSubviews{
    
    NSURL* url = [NSURL URLWithString:_chatModel.userImage];
    [_userImageView sd_setImageWithURL:url];
    _nickName.text = _chatModel.nickname;
    _content.text = _chatModel.content;
    _rating.text = _chatModel.rating;
    _backImageView.backgroundColor = [UIColor whiteColor];
    
}


@end
