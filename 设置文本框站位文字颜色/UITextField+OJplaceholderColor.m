//
//  UITextField+OJplaceholderColor.m
//  baisi
//
//  Created by One'J on 16/3/16.
//  Copyright © 2016年 One'J. All rights reserved.
//

#import "UITextField+OJplaceholderColor.h"
#import <objc/message.h>

@implementation UITextField (OJplaceholderColor)

+ (void)load
{
    // setPlaceholder
    Method setPlaceholderMethod = class_getInstanceMethod(self, @selector(setPlaceholder:));
    Method setOj_PlaceholderMethod = class_getInstanceMethod(self, @selector(setOj_Placeholder:));
    
    method_exchangeImplementations(setPlaceholderMethod, setOj_PlaceholderMethod);
}
- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    
    // 给成员属性赋值 runtime给系统的类添加成员属性
    // 添加成员属性
    objc_setAssociatedObject(self, @"placeholderColor", placeholderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    // 获取占位文字label控件
    UILabel *placeholderLabel = [self valueForKey:@"placeholderLabel"];
    
    // 设置占位文字颜色
    placeholderLabel.textColor = placeholderColor;
}


- (UIColor *)placeholderColor
{
    return objc_getAssociatedObject(self, @"placeholderColor");
}

// 设置占位文字
// 设置占位文字颜色
- (void)setOj_Placeholder:(NSString *)placeholder
{
    [self setOj_Placeholder:placeholder];
    
    self.placeholderColor = self.placeholderColor;
}

@end
