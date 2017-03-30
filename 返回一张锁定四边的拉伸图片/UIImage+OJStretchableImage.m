//
//  UIImage+OJStretchableImage.m
//  cpLottery
//
//  Created by OneJ on 2017/3/30.
//  Copyright © 2017年 cpnet. All rights reserved.
//

#import "UIImage+OJStretchableImage.h"

@implementation UIImage (OJStretchableImage)
+(UIImage *)stretchableImage:(NSString *)imageName {
    UIImage *image = [UIImage imageNamed:imageName];
    // 左端盖宽度
    NSInteger leftCapWidth = image.size.width * 0.3f;
    // 顶端盖高度
    NSInteger topCapHeight = image.size.height * 0.3f;
    // 重新赋值
    image = [image stretchableImageWithLeftCapWidth:leftCapWidth topCapHeight:topCapHeight];
    return image;
}
@end
