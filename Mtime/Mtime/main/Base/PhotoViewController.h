//
//  PhotoViewController.h
//  Mtime
//
//  Created by Mee Leo on 23/7/15.
//  Copyright (c) 2015年 Mee Leo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoCollectionView.h"
@interface PhotoViewController : UIViewController
@property (strong,nonatomic) PhotoCollectionView* collectionView;
@property (strong,nonatomic) NSArray* imageURLArray;
@end
