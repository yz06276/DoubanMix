//
//  MovieModel.m
//  Mtime
//
//  Created by Mee Leo on 20/7/15.
//  Copyright (c) 2015年 Mee Leo. All rights reserved.
//

#import "MovieModel.h"

@implementation MovieModel

-(NSString *)description{

    return [NSString stringWithFormat:@"name:%@   year:%@",_title,_year];
    
}

@end
