//
//  ImageEnlargeViewController.m
//  Init
//
//  Created by 赵世杰 on 16/4/11.
//  Copyright © 2016年 zhaoshijie. All rights reserved.
//

#import "ImageEnlargeViewController.h"
#import "ImageEnlargeCell.h"

@interface ImageEnlargeViewController ()

// 显示图片的视图
@property (nonatomic,strong) UIImageView *imageView ;

// 显示缩放视图
@property (nonatomic,strong) UICollectionView *collectionView ;

@end

@implementation ImageEnlargeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init] ;
    flowLayout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) ;
    flowLayout.minimumInteritemSpacing = 0 ;
    flowLayout.minimumInteritemSpacing = 0 ;
    // 设置方法
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal ;
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(-5, 0, [UIScreen mainScreen].bounds.size.width+10, [UIScreen mainScreen].bounds.size.height) collectionViewLayout:flowLayout] ;
    self.collectionView.backgroundColor = [UIColor colorWithRed:0.8405 green:0.8318 blue:0.8493 alpha:1.0] ;
    self.collectionView.delegate = self ;
    self.collectionView.dataSource = self ;
    self.collectionView.pagingEnabled = YES ;
    self.collectionView.showsHorizontalScrollIndicator = NO ;
    [self.collectionView registerClass:[ImageEnlargeCell class] forCellWithReuseIdentifier:@"cellID"] ;
    [self.view addSubview:self.collectionView] ;
    
    
    // 创建下面页数显示的文本
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(100, [UIScreen mainScreen].bounds.size.height-60, [UIScreen mainScreen].bounds.size.width-200, 20)] ;
    self.label.textAlignment = NSTextAlignmentCenter ;
    self.label.textColor = [UIColor whiteColor] ;
    self.label.text = [NSString stringWithFormat:@"1/%lu",(unsigned long)self.imageUrlArrays.count] ;
    
    [self.view addSubview:self.label] ;
    
    
    // 拿到bundle里面的图片
    NSString *bundlePath = [[NSBundle mainBundle]pathForResource:@"SJClickEnlarge" ofType:@"Bundle"] ;
    NSString *imagePath = [bundlePath stringByAppendingPathComponent:@"sitting_04@2x.png"] ;
    UIImage *image = [UIImage imageWithContentsOfFile:imagePath] ;
    // 自定义返回按键button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom] ;
    button.frame = CGRectMake(10, 20, 30, 30) ;
    [button setImage:image forState:UIControlStateNormal] ;
    [button addTarget:self action:@selector(returnButtonAction) forControlEvents:UIControlEventTouchUpInside] ;
    [self.view addSubview:button] ;
}

#pragma mark button等视图的点击事件-------------------------------------
- (void)returnButtonAction
{
    [self dismissViewControllerAnimated:YES completion:nil] ;
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imageUrlArrays.count ;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID" ;
    ImageEnlargeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath] ;
    // 传数据
    cell.imageUrlString = self.imageUrlArrays[indexPath.row] ;
    // 刷新视图
    [cell setNeedsLayout] ;
    return cell ;
}


#pragma mark - UICollectionView 继承父类的方法------------------------------------
// 减速结束
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
//    NSLog(@"停止减速，滑动视图停止了");
    
    // 视图停止滑动的时候执行一些操作
    int pageIndex = (int)self.collectionView.contentOffset.x / [UIScreen mainScreen].bounds.size.width ;
    self.label.text = [NSString stringWithFormat:@"%d/%lu",pageIndex+1,(unsigned long)self.imageUrlArrays.count] ;

}

// 当前滑动视图停止滑动的时候执行一些操作
- (void)scrollDidSroll
{

    int pageIndex = (int)self.collectionView.contentOffset.x / [UIScreen mainScreen].bounds.size.width ;
    self.label.text = [NSString stringWithFormat:@"%d/%lu",pageIndex+1,(unsigned long)self.imageUrlArrays.count] ;
    
}


@end
