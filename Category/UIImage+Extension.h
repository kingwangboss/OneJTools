//
//  UIImage+Extension.h
//  HLJSportsLottery
//
//  Created by apple on 16/9/21.
//  Copyright © 2016年 俞明. All rights reserved.
//

#import <UIKit/UIKit.h>
/*
 *  水印方向
 */
typedef enum {
    
    //左上
    ImageWaterDirectTopLeft=0,
    
    //右上
    ImageWaterDirectTopRight,
    
    //左下
    ImageWaterDirectBottomLeft,
    
    //右下
    ImageWaterDirectBottomRight,
    
    //正中
    ImageWaterDirectCenter
    
}ImageWaterDirect;


@interface UIImage (Extension)

/**
 *  自由改变Image的大小
 *
 *  @param size 目的大小
 *
 *  @return 修改后的Image
 */
- (UIImage *)cropImageWithSize:(CGSize)size;
/**
 *  根据图片和颜色返回一张加深颜色以后的图片
 */
+ (UIImage *)colorizeImage:(UIImage *)baseImage withColor:(UIColor *)theColor;
/**
 *  根据颜色和大小获取Image
 *
 *  @param color 颜色
 *  @param size  大小
 *
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

/**
 *  自由拉伸一张图片
 *
 *  @param name 图片名字
 *  @param left 左边开始位置比例  值范围0-1
 *  @param top  上边开始位置比例  值范围0-1
 *
 *  @return 拉伸后的Image
 */
+ (UIImage *)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top;

/**
 *  @author 俞明, 16-10-26 09:10:30
 *
 *  由颜色生成图片
 *
 */
+ (UIImage *) imageWithColor:(UIColor*)color;

/**
 *  @author 俞明, 16-10-26 09:10:20
 *
 *  图片旋转角度
 *
 */
- (UIImage *) imageRotatedByDegrees:(CGFloat)degrees;

/**
 *  @author 俞明, 16-10-26 09:10:11
 *
 *  拉伸图片UIEdgeInsets
 */
- (UIImage *) resizableImage:(UIEdgeInsets)insets;

/**
 *  @author 俞明, 16-10-26 09:10:02
 *
 *  拉伸图片CGFloat
 */
- (UIImage *) imageByResizeToScale:(CGFloat)scale;

/**
 *  @author 俞明, 16-10-26 09:10:33
 *
 *  放大图片CGSize
 */
- (UIImage *) imageByResizeWithMaxSize:(CGSize)size;

/**
 *  @author 俞明, 16-10-26 09:10:54
 *
 *  小样图图片CGSize
 *
 *  @param size 大小
 *
 */
- (UIImage *) imageWithThumbnailForSize:(CGSize)size;

/**
 *  @author 俞明, 16-10-26 09:10:25
 *
 *  通过Rect剪裁图片
 *
 *  @param rect 矩形
 *
 */
- (UIImage *) imageByCropToRect:(CGRect)rect;

/**
 *  @author 俞明, 16-10-26 09:10:12
 *
 *  图片增加圆角
 *
 *  @param radius 圆角
 *
 */
- (UIImage *) imageByRoundCornerRadius:(CGFloat)radius;

/**
 *  @author 俞明, 16-10-26 09:10:32
 *
 *  图片增加圆角及边框
 *
 *  @param radius      圆角
 *  @param borderWidth 宽度
 *  @param borderColor 颜色
 *
 */
- (UIImage *) imageByRoundCornerRadius:(CGFloat)radius
                           borderWidth:(CGFloat)borderWidth
                           borderColor:(UIColor *)borderColor;

/**
 *  保存相册
 *
 *  @param completeBlock 成功回调
 *  @param completeBlock 出错回调
 */
-(void)savedPhotosAlbum:(void(^)())completeBlock failBlock:(void(^)())failBlock;
#pragma mark - 水印
-(UIImage *)waterWithText:(NSString *)text direction:(ImageWaterDirect)direction fontColor:(UIColor *)fontColor fontPoint:(CGFloat)fontPoint marginXY:(CGPoint)marginXY;


-(UIImage *)waterWithWaterImage:(UIImage *)waterImage direction:(ImageWaterDirect)direction waterSize:(CGSize)waterSize  marginXY:(CGPoint)marginXY;


@end
