//
//  OJFileTool.h
//  baisi
//
//  Created by One'J on 16/3/17.
//  Copyright © 2016年 One'J. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OJFileTool : NSObject

/**
 *  获取文件夹尺寸
 *
 *  @param directoryPath 文件夹路径
 *
 *  @return 返回文件夹尺寸
 */
+ (void)getFileSize:(NSString *)directoryPath completion:(void(^)(NSInteger))completion;


/**
 *  删除文件夹所有文件
 *
 *  @param directoryPath 文件夹路径
 */
+ (void)removeDirectoryPath:(NSString *)directoryPath;

@end
