//
//  DistrictList.h
//  Mtime
//
//  Created by Mee Leo on 27/7/15.
//  Copyright (c) 2015年 Mee Leo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CinemaModel.h"

@interface DistrictList : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *id;

@property (nonatomic,strong)NSMutableArray* cinemaModelArray;

@property (nonatomic) BOOL isHide;

@end