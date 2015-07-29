//
//  ChatModel.h
//  Mtime
//
//  Created by Mee Leo on 28/7/15.
//  Copyright (c) 2015年 Mee Leo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ChatModel;
@interface ChatModel : NSObject


@property (nonatomic, copy) NSString *userImage;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *nickname;

@property (nonatomic, copy) NSString *rating;

@end
