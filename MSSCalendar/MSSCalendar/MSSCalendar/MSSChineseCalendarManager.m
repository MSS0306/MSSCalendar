//
//  MSSChineseCalendarManager.m
//  MSSCalendar
//
//  Created by 于威 on 16/4/4.
//  Copyright © 2016年 于威. All rights reserved.
//

#import "MSSChineseCalendarManager.h"

@interface MSSChineseCalendarManager ()
@property (nonatomic,strong)NSCalendar *chineseCalendar;
@property (nonatomic,strong)NSArray *chineseYearArray;
@property (nonatomic,strong)NSArray *chineseMonthArray;
@property (nonatomic,strong)NSArray *chineseDayArray;
@end

@implementation MSSChineseCalendarManager

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        _chineseCalendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSChineseCalendar];
        _chineseYearArray = [NSArray arrayWithObjects:
                                 @"甲子", @"乙丑", @"丙寅", @"丁卯",  @"戊辰",  @"己巳",  @"庚午",  @"辛未",  @"壬申",  @"癸酉",
                                 @"甲戌",   @"乙亥",  @"丙子",  @"丁丑", @"戊寅",   @"己卯",  @"庚辰",  @"辛己",  @"壬午",  @"癸未",
                                 @"甲申",   @"乙酉",  @"丙戌",  @"丁亥",  @"戊子",  @"己丑",  @"庚寅",  @"辛卯",  @"壬辰",  @"癸巳",
                                 @"甲午",   @"乙未",  @"丙申",  @"丁酉",  @"戊戌",  @"己亥",  @"庚子",  @"辛丑",  @"壬寅",  @"癸丑",
                                 @"甲辰",   @"乙巳",  @"丙午",  @"丁未",  @"戊申",  @"己酉",  @"庚戌",  @"辛亥",  @"壬子",  @"癸丑",
                                 @"甲寅",   @"乙卯",  @"丙辰",  @"丁巳",  @"戊午",  @"己未",  @"庚申",  @"辛酉",  @"壬戌",  @"癸亥", nil];
        _chineseMonthArray = [NSArray arrayWithObjects:
                          @"正月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月",
                          @"九月", @"十月", @"冬月", @"腊月", nil];
        _chineseDayArray = [NSArray arrayWithObjects:
                        @"初一", @"初二", @"初三", @"初四", @"初五", @"初六", @"初七", @"初八", @"初九", @"初十",
                        @"十一", @"十二", @"十三", @"十四", @"十五", @"十六", @"十七", @"十八", @"十九", @"二十",
                        @"廿一", @"廿二", @"廿三", @"廿四", @"廿五", @"廿六", @"廿七", @"廿八", @"廿九", @"三十",  nil];
    }
    return self;
}

- (void)getChineseCalendarWithDate:(NSDate *)date calendarItem:(MSSCalendarModel *)calendarItem
{
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
    
    NSDateComponents *localeComp = [_chineseCalendar components:unitFlags fromDate:date];
//    NSString *chineseYear = [_chineseYearArray objectAtIndex:localeComp.year - 1];
    NSString *chineseMonth = [_chineseMonthArray objectAtIndex:localeComp.month - 1];
    NSString *chineseDay = [_chineseDayArray objectAtIndex:localeComp.day - 1];
    
    calendarItem.chineseCalendar = chineseDay;
    
    if([@"正月" isEqualToString:chineseMonth] &&
       [@"初一" isEqualToString:chineseDay])
    {
        calendarItem.chineseCalendar = @"春节";
    }
    else if([@"正月" isEqualToString:chineseMonth] &&
            [@"十五" isEqualToString:chineseDay])
    {
        calendarItem.chineseCalendar = @"元宵";
    }
    else if([@"二月" isEqualToString:chineseMonth] &&
            [@"初二" isEqualToString:chineseDay])
    {
        calendarItem.chineseCalendar = @"龙抬头";
    }
    else if([@"五月" isEqualToString:chineseMonth] &&
            [@"初五" isEqualToString:chineseDay])
    {
        calendarItem.chineseCalendar = @"端午";
    }
    else if([@"七月" isEqualToString:chineseMonth] &&
            [@"初七" isEqualToString:chineseDay])
    {
        calendarItem.chineseCalendar = @"七夕";
    }
    else if([@"八月" isEqualToString:chineseMonth] &&
            [@"十五" isEqualToString:chineseDay])
    {
        calendarItem.chineseCalendar = @"中秋";
    }
    else if([@"九月" isEqualToString:chineseMonth] &&
            [@"初九" isEqualToString:chineseDay])
    {
        calendarItem.chineseCalendar = @"重阳";
    }
    else if([@"腊月" isEqualToString:chineseMonth] &&
            [@"初八" isEqualToString:chineseDay])
    {
        calendarItem.chineseCalendar = @"腊八";
    }
    else if([@"腊月" isEqualToString:chineseMonth] &&
            [@"二四" isEqualToString:chineseDay])
    {
        calendarItem.chineseCalendar = @"小年";
    }
    else if([@"腊月" isEqualToString:chineseMonth] &&
            [@"三十" isEqualToString:chineseDay])
    {
        calendarItem.chineseCalendar = @"除夕";
    }
}

@end
