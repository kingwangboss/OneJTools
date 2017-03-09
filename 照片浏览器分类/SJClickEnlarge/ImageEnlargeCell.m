//
//  ImageEnlargeCell.m
//  Init
//
//  Created by 赵世杰 on 16/4/11.
//  Copyright © 2016年 zhaoshijie. All rights reserved.
//

#import "ImageEnlargeCell.h"
#import "UIImageView+WebCache.h"

@implementation ImageEnlargeCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // 创建子视图
        [self _initViews] ;
    }
    return self;
}


/**
 *  创建子视图
 */
- (void)_initViews
{
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(5, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)] ;
    _scrollView.maximumZoomScale = 3.0 ;
    _scrollView.minimumZoomScale = 1.0 ;
    _scrollView.delegate = self ;
    [self.contentView addSubview:_scrollView] ;
    
    self.imageView = [[UIImageView alloc]initWithFrame:_scrollView.bounds] ;
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    // 开启点击事件
    self.imageView.userInteractionEnabled = YES ;
    [_scrollView addSubview:self.imageView] ;
    
    // 给图片数据添加一个点击事件
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageViewTapAction)] ;
    [self.imageView addGestureRecognizer:tap] ;
}


/**
 *  图片的点击事件
 */
- (void)imageViewTapAction
{
    // 还原原始比例
    [UIView animateWithDuration:0.2 animations:^{
        self.scrollView.zoomScale = 1.0 ;
    }] ;
}

/**
 *  复用方法
 */
- (void)layoutSubviews
{
    [super layoutSubviews] ;
    
    _scrollView.zoomScale = 1.0 ;
    NSURL *url = [NSURL URLWithString:self.imageUrlString] ;
    [self.imageView sd_setImageWithURL:url] ;
}


#pragma mark - UIScrollView的代理方法
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView ;
}

@end
