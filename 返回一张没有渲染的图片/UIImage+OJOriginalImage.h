//
//  UIImage+OJOriginalImage.h
//  baisi
//
//  Created by One'J on 16/3/11.
//  Copyright © 2016年 One'J. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (OJOriginalImage)


/**
 *  返回一张没有渲染的图片
 *
 *  @param name 图片名
 *
 *  @return 返回一张没有渲染的图片
 */
+(UIImage *)imageOriginalWithNamed:(NSString *)name;

@end
