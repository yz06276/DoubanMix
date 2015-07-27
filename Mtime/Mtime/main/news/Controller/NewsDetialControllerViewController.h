//
//  NewsDetialControllerViewController.h
//  Mtime
//
//  Created by Mee Leo on 22/7/15.
//  Copyright (c) 2015年 Mee Leo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "newsModel.h"

@interface NewsDetialControllerViewController : UIViewController
@property (strong, nonatomic) IBOutlet UICollectionView *newsCollectionView;
@property (strong,nonatomic ) newsModel* newsModel;

@end
