//
//  UIView+viewController.m
//  WXMove_demo
//
//  Created by king_linfu on 14-11-19.
//  Copyright (c) 2014年 无线互联3G学院. All rights reserved.
//

#import "UIView+viewController.h"

@implementation UIView (viewController)

- (UIViewController *)viewController
{
    // 拿到下一个响应者
    UIResponder *nextRes = self.nextResponder;
    
    do {
        
        if ([nextRes isKindOfClass:[UIViewController class]]) {
            
            // 如果响应者是 viewController 则返回
            return (UIViewController *)nextRes;
        }
        
        nextRes = nextRes.nextResponder;
        
    } while (nextRes != nil);
    
    return nil;
}


@end
