//
//  OJPageView.m
//  01-分页功能-XMGPageView的封装
//
//  Created by kingwang on 16/1/5.
//  Copyright © 2016年 One'J. All rights reserved.
//

#import "OJPageView.h"

@interface OJPageView()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;


/**
 *  定时器
 */
@property(nonatomic,weak) NSTimer *timer;

@end

@implementation OJPageView

-(void)awakeFromNib
{
    self.scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.pageControl.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin;
    
    //单页隐藏pageControl
    self.pageControl.highlighted = YES;
    
    //设置pageControl图片
    [self.pageControl setValue:[UIImage imageNamed:@"current"] forKeyPath:@"_currentPageImage"];
    [self.pageControl setValue:[UIImage imageNamed:@"other"] forKeyPath:@"_pageImage"];
    
    //开启定时器
    [self startTimer];
    
}

+(instancetype)pageView
{
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

-(void)setImageNames:(NSArray *)imageNames
{
    _imageNames = imageNames;
    
    //移除之前添加的图片
    [self.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    //添加图片
    CGFloat scrollViewW = self.scrollView.frame.size.width;
    CGFloat scrollViewH = self.scrollView.frame.size.height;
    NSInteger count = 5;
    
    for (int i = 0; i < count; i++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        imageView.image = [UIImage imageNamed:imageNames[i]];
        imageView.frame = CGRectMake(i*scrollViewW, 0, scrollViewW, scrollViewH);
        [self.scrollView addSubview:imageView];
        
    }
    
    //设置contentSize
    self.scrollView.contentSize = CGSizeMake(count*scrollViewW, 0);
    
    //设置总页数
    self.pageControl.numberOfPages = count;
    
//    self.scrollView.pagingEnabled = YES;
    
}

#pragma mark - 定时器相关的代码
- (void)startTimer
{
    // 返回一个自动执行的定时器对象
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextPage:) userInfo:@"123" repeats:YES];
    
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)stopTimer
{
    [self.timer invalidate];
}

/**
 *  滚动到下一页
 */
- (void)nextPage:(NSTimer *)timer
{
    // 1.计算下一页的页码
    NSInteger page = self.pageControl.currentPage + 1;
    
    // 2.超过了最后一页
    if ( page == self.imageNames.count) {
        page = 0;
    }
    
    // 3.滚动到下一页
    [self.scrollView setContentOffset:CGPointMake(page * self.scrollView.frame.size.width, 0) animated:YES];
}


#pragma mark - UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //计算页码
    int page = (int)(scrollView.contentOffset.x / scrollView.frame.size.width + 0.5);
    //设置页码
    self.pageControl.currentPage = page;
}

/**
 *  用户即将开始拖拽scrollView时,停止定时器
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self stopTimer];
}

/**
 *  用户已经停止拖拽scrollView时,开启定时器
 */
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self startTimer];
}

@end
