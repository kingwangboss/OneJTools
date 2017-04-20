//
//  OJLabel.m
//  cpLottery
//
//  Created by OneJ on 2017/3/31.
//  Copyright © 2017年 cpnet. All rights reserved.
//

#import "OJLabel.h"

@implementation OJLabel

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    // 取文字的颜色作为删除线的颜色
    [self.textColor set];
    CGFloat w = rect.size.width;
    CGFloat h = rect.size.height;
    // 绘制(0.5是label的中间位置,可以自己调整) 
    UIRectFill(CGRectMake(0, h * 0.5, w, 1));
}

@end
