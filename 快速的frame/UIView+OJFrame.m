//
//  UIView+OJFrame.m
//  baisi
//
//  Created by One'J on 16/3/12.
//  Copyright © 2016年 One'J. All rights reserved.
//

#import "UIView+OJFrame.h"

@implementation UIView (OJFrame)

-(void)setOj_height:(CGFloat)oj_height
{
    CGRect rect = self.frame;
    rect.size.height = oj_height;
    self.frame = rect;
    
}

-(CGFloat)oj_height
{
    return self.frame.size.height;
}

- (CGFloat)oj_width
{
    return self.frame.size.width;
}
- (void)setOj_width:(CGFloat)oj_width
{
    CGRect rect = self.frame;
    rect.size.width = oj_width;
    self.frame = rect;
}

- (CGFloat)oj_x
{
    return self.frame.origin.x;
    
}

- (void)setOj_x:(CGFloat)oj_x
{
    CGRect rect = self.frame;
    rect.origin.x = oj_x;
    self.frame = rect;
}

- (void)setOj_y:(CGFloat)oj_y
{
    CGRect rect = self.frame;
    rect.origin.y = oj_y;
    self.frame = rect;
}

- (CGFloat)oj_y
{
    
    return self.frame.origin.y;
}
-(void)setOj_centerX:(CGFloat)oj_centerX
{
    CGPoint center = self.center;
    center.x = oj_centerX;
    self.center = center;
    
}

- (CGFloat)oj_centerX
{
    return self.center.x;
}

- (void)setOj_centerY:(CGFloat)oj_centerY
{
    CGPoint center = self.center;
    center.y = oj_centerY;
    self.center = center;
}

- (CGFloat)oj_centerY
{
    return self.center.y;
}


@end
