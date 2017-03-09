//
//  UIButton+CornerBtn.h
//  按钮切圆角
//
//  Created by One'J on 16/7/6.
//  Copyright © 2016年 One'J. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CornerBtn)

/**
 *  圆角0:左下 1：右下 2：左上 3：右上 4：左下右下 5：左上右上 6：左下左上
 *  7：右下右上 8：右上右下左上 9：右上右下左下 其他：全圆角
 */
-(void)buttonWithCorner:(int)style width:(CGFloat)width height:(CGFloat)height;

@end
