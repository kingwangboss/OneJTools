//
//  NSString+OJStringSize.m
//  cpLottery
//
//  Created by OneJ on 2017/3/10.
//  Copyright © 2017年 cpnet. All rights reserved.
//

#import "NSString+OJStringSize.h"

@implementation NSString (OJStringSize)
- (CGSize)sizeWithLabelWidth:(CGFloat)width font:(UIFont *)font{
    
    NSDictionary *dict=@{NSFontAttributeName : font};
    CGRect rect=[self boundingRectWithSize:CGSizeMake(width,MAXFLOAT) options:(NSStringDrawingUsesLineFragmentOrigin)attributes:dict context:nil];
    CGFloat sizeWidth=ceilf(CGRectGetWidth(rect));
    CGFloat sizeHieght=ceilf(CGRectGetHeight(rect));
    return CGSizeMake(sizeWidth, sizeHieght);
}
@end
