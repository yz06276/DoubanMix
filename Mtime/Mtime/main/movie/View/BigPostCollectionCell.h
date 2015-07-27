//
//  BigPostCollectionCell.h
//  Mtime
//
//  Created by Mee Leo on 26/7/15.
//  Copyright (c) 2015年 Mee Leo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieModel.h"
#import "starView.h"

@interface BigPostCollectionCell : UIView

@property (strong,nonatomic) MovieModel  * movieModel;
@property (strong,nonatomic) NSArray     * movieArray;
@property (nonatomic       ) CGFloat     labelHeight1;
@property (nonatomic       ) CGFloat     labelHeight2;
@property (nonatomic,strong) UIView      * frontView;
@property (nonatomic,strong) UIView      * backView;

@property (nonatomic,strong) UIImageView * bigPostView;

@property (nonatomic,strong) UIImageView * littlePostView;
@property (nonatomic,strong) UILabel     * original_title;
@property (nonatomic,strong) UILabel     * title;
@property (nonatomic,strong) starView    * star;
@property (nonatomic,strong) UILabel     * year;
@property (nonatomic,strong) UILabel     * average;

@property (nonatomic       ) CGFloat     height1;
@property (nonatomic       ) CGFloat     height2;
@property (nonatomic       ) CGFloat     labelWidth;
@property (nonatomic       ) CGFloat     labelX;
@property (nonatomic       ) CGFloat     labelY;
@end
