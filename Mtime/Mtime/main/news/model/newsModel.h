//
//  newsModel.h
//  Mtime
//
//  Created by Mee Leo on 21/7/15.
//  Copyright (c) 2015年 Mee Leo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface newsModel : NSObject

@property (nonatomic,strong) NSString* title;
@property (nonatomic,strong) NSString* summary;
@property (nonatomic,strong) NSString* image;
@property (nonatomic,assign) NSInteger type;


@end
