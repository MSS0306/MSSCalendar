//
//  MSSCalendarHeaderModel.h
//  MSSCalendar
//
//  Created by 于威 on 16/4/4.
//  Copyright © 2016年 于威. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSSCalendarHeaderModel : NSObject
@property (nonatomic,copy)NSString *headerText;
@property (nonatomic,strong)NSArray *calendarItemArray;
@end

typedef NS_ENUM(NSInteger, MSSCalendarType)
{
    MSSCalendarTodayType = 0,
    MSSCalendarLastType,
    MSSCalendarNextType
};

@interface MSSCalendarModel : NSObject

@property (nonatomic,assign)NSInteger year;
@property (nonatomic,assign)NSInteger month;
@property (nonatomic,assign)NSInteger day;
@property (nonatomic,copy)NSString *chineseCalendar;// 农历
@property (nonatomic,copy)NSString *holiday;// 节日
@property (nonatomic,assign)MSSCalendarType type;
@property (nonatomic,assign)NSInteger dateInterval;// 日期的时间戳
@property (nonatomic,assign)NSInteger week;// 星期

@end