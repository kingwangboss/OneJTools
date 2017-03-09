//
//  OJPageView.h
//  01-分页功能-XMGPageView的封装
//
//  Created by kingwang on 16/1/5.
//  Copyright © 2016年 One'J. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OJPageView : UIView

/**
 *  图片数据
 */
@property(nonatomic,strong) NSArray *imageNames;

+(instancetype)pageView;

@end
