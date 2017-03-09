//
//  UIImage+image.h
//  02-带有边框的圆形图片裁剪
//
//  Created by One'J on 16/1/25.
//  Copyright © 2016年 One'J. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (image)
+(UIImage *)imageWithBorder:(CGFloat)borderW andColor:(UIColor *)borderColor andImage:(UIImage *)image;

- (UIImage *)oj_circleImage;

+ (UIImage *)oj_circleImageNamed:(NSString *)name;

@end
