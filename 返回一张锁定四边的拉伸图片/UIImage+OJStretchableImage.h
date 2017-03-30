//
//  UIImage+OJStretchableImage.h
//  cpLottery
//
//  Created by OneJ on 2017/3/30.
//  Copyright © 2017年 cpnet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (OJStretchableImage)
/**
 锁住四边中间拉伸图片
 
 @param imageName 图片名
 @return 图片
 */
+(UIImage *)stretchableImage:(NSString *)imageName;
@end
