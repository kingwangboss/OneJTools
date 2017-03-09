//
//  UIImage+image.m
//  02-带有边框的圆形图片裁剪
//
//  Created by One'J on 16/1/25.
//  Copyright © 2016年 One'J. All rights reserved.
//

#import "UIImage+image.h"

@implementation UIImage (image)

+(UIImage *)imageWithBorder:(CGFloat)borderW andColor:(UIColor *)borderColor andImage:(UIImage *)image
{
    //开启上下文
    CGSize size = CGSizeMake(image.size.width + 2 * borderW, image.size.height + 2 * borderW);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    //绘制大图，显示出来
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.height)];
    
    [borderColor set];
    [path fill];
    
    //绘制一个小圆,把小圆设置成裁剪区域
    UIBezierPath *clippath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderW, borderW, image.size.width, image.size.height)];
    [clippath addClip];
    
    //把图片绘制到上下文
    [image drawAtPoint:CGPointMake(borderW, borderW)];
    
    //从上下文中取出图片
    UIImage *newimage = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭上下文
    UIGraphicsEndImageContext();
    return newimage;
}

- (UIImage *)oj_circleImage
{
    // 1.开启图形上下文
    // 比例因素:当前点与像素比例
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0);
    // 2.描述裁剪区域
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    // 3.设置裁剪区域;
    [path addClip];
    // 4.画图片
    [self drawAtPoint:CGPointZero];
    // 5.取出图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 6.关闭上下文
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)oj_circleImageNamed:(NSString *)name
{
    return [[self imageNamed:name] oj_circleImage];
}

@end
