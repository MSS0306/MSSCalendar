//
//  MSSChineseCalendarManager.h
//  MSSCalendar
//
//  Created by 于威 on 16/4/4.
//  Copyright © 2016年 于威. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSSCalendarHeaderModel.h"

@interface MSSChineseCalendarManager : NSObject

- (void)getChineseCalendarWithDate:(NSDate *)date calendarItem:(MSSCalendarModel *)calendarItem;

- (BOOL)isQingMingholidayWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;

@end
