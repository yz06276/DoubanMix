//
//  customButton.h
//  Mtime
//
//  Created by Mee Leo on 17/7/15.
//  Copyright (c) 2015年 Mee Leo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface customButton : UIControl

@property (nonatomic,strong)UIImageView* imageView;
@property (nonatomic,strong)UILabel*  label;


-(instancetype)initWithFrame:(CGRect)frame withImageName:(NSString*)imageName withTitle:(NSString*)title;

@end
