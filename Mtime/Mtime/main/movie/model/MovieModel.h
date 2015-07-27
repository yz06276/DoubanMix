//
//  MovieModel.h
//  Mtime
//
//  Created by Mee Leo on 20/7/15.
//  Copyright (c) 2015年 Mee Leo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MovieModel : NSObject

@property (nonatomic,copy) NSString* title;
@property (nonatomic,copy) NSString* original_title;
@property (nonatomic,copy) NSString* year;
@property (nonatomic,strong) NSDictionary* image;
@property (nonatomic,copy) NSString* stars;
@property (nonatomic,assign)float average;
@property (nonatomic,assign)NSInteger type;


@end
