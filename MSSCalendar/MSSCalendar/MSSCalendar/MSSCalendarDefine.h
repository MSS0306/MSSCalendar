//
//  MSSCalendarDefine.h
//  MSSCalendar
//
//  Created by 于威 on 16/4/4.
//  Copyright © 2016年 于威. All rights reserved.
//

#define MSS_SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define MSS_SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define MSS_UTILS_COLORRGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define MSS_Iphone6Scale(x) ((x) * MSS_SCREEN_WIDTH / 375.0f)
#define MSS_ONE_PIXEL (1.0f / [[UIScreen mainScreen] scale])

/*定义属性*/
// DateLabel默认文字颜色
#define MSS_TextColor [UIColor blackColor]
// DateLabel选中时的背景色
#define MSS_SelectBackgroundColor MSS_UTILS_COLORRGB(29, 154, 72)
// DateLabel选中后文字颜色
#define MSS_SelectTextColor [UIColor whiteColor]
// SubLabel文字颜色
#define MSS_SelectSubLabelTextColor MSS_UTILS_COLORRGB(29, 154, 180);
// SubLabel选中开始文字
#define MSS_SelectBeginText @"开始"
// SubLabel选中结束文字
#define MSS_SelectEndText @"结束"
// 节日颜色
#define MSS_HolidayTextColor [UIColor purpleColor]
// 周末颜色
#define MSS_WeekEndTextColor [UIColor redColor]
// 不可点击文字颜色
#define MSS_TouchUnableTextColor MSS_UTILS_COLORRGB(150, 150, 150)
// 周视图高度
#define MSS_WeekViewHeight 40
// headerView线颜色
#define MSS_HeaderViewLineColor [UIColor lightGrayColor]
// headerView文字颜色
#define MSS_HeaderViewTextColor [UIColor blackColor]
// headerView高度
#define MSS_HeaderViewHeight 50
// 弹出层文字颜色
#define MSS_CalendarPopViewTextColor [UIColor whiteColor]
// 弹出层背景颜色
#define MSS_CalendarPopViewBackgroundColor [UIColor blackColor]


