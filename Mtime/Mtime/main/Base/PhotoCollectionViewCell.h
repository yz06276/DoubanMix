//
//  PhotoCollectionViewCell.h
//  Mtime
//
//  Created by Mee Leo on 23/7/15.
//  Copyright (c) 2015年 Mee Leo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoScrollView.h"

@interface PhotoCollectionViewCell : UICollectionViewCell

@property (strong,nonatomic)NSURL* imageURL;
@property (strong,nonatomic) PhotoScrollView* scrollView;

@end
