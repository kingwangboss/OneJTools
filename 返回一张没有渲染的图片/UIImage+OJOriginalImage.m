//
//  UIImage+OJOriginalImage.m
//  baisi
//
//  Created by One'J on 16/3/11.
//  Copyright © 2016年 One'J. All rights reserved.
//

#import "UIImage+OJOriginalImage.h"

@implementation UIImage (OJOriginalImage)

+(UIImage *)imageOriginalWithNamed:(NSString *)name
{
    UIImage *image = [UIImage imageNamed:name];
    
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

@end
