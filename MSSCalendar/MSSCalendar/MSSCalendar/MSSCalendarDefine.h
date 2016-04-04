//
//  MSSCalendarDefine.h
//  MSSCalendar
//
//  Created by 于威 on 16/4/4.
//  Copyright © 2016年 于威. All rights reserved.
//

// 选中时的背景色
#define MSS_SelectBackgroundColor MSS_UTILS_COLORRGB(29, 154, 72)
// 选中后文字颜色
#define MSS_SelectTextColor [UIColor whiteColor]
// 选中开始文字
#define MSS_SelectBegintText @"开始"
// 选中结束文字
#define MSS_SelectEndText @"结束"

#define MSS_SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define MSS_SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define MSS_UTILS_COLORRGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define MSS_Iphone6Scale(x) ((x) * MSS_SCREEN_WIDTH / 375.0f)
#define MSS_ONE_PIXEL (1.0f / [[UIScreen mainScreen] scale])
