//
//  UIBarButtonItem+Item.h
//  baisi
//
//  Created by One'J on 16/3/11.
//  Copyright © 2016年 One'J. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Item)
// 快速创建UIBarButtonItem
+ (UIBarButtonItem *)itemWithimage:(UIImage *)image highLightedImage:(UIImage *)highLightedImage target:(id)target action:(SEL)action;

+ (UIBarButtonItem *)itemBackWithimage:(UIImage *)image highLightedImage:(UIImage *)highLightedImage target:(id)target action:(SEL)action title:(NSString *)title;

+ (UIBarButtonItem *)itemWithimage:(UIImage *)image selctedImage:(UIImage *)selctedImage target:(id)target action:(SEL)action;

@end
