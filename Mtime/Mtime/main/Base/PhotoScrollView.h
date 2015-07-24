//
//  PhotoScrollView.h
//  Mtime
//
//  Created by Mee Leo on 23/7/15.
//  Copyright (c) 2015年 Mee Leo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoScrollView : UIScrollView<UIScrollViewDelegate>


@property (strong,nonatomic)UIImageView* imageView;
@property (strong,retain)NSURL* URL;

@end
