//
//  NSDateFormatter+DBLibrary.m
//  DBAttachmentPickerControllerExample
//
//  Created by Denis Bogatyrev on 22.03.16.
//  Copyright © 2016 Denis Bogatyrev. All rights reserved.
//

#import "NSDateFormatter+DBLibrary.h"

@implementation NSDateFormatter (DBLibrary)

+ (NSDateFormatter *)localizedDateTimeFormatter {
    static dispatch_once_t onceToken;
    static NSDateFormatter *dateFormatter;
    dispatch_once(&onceToken, ^{
        dateFormatter = [NSDateFormatter new];
        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
        [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
        [dateFormatter setLocale:[NSLocale currentLocale]];
    });
    return dateFormatter;
}

@end
