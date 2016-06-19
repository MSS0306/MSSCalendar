# MSSCalendar
A simple iOS Calendar 一款简单高性能的日历（类似去哪网）

![效果图](https://raw.githubusercontent.com/MSS0306/MSSCalendar/master/calendar.gif)

# 说明
一款高性能的日历控件<br/>
MSSCalendarDefine.h中可设置相应文字和颜色<br/>
DateLabel默认文字颜色：MSS_TextColor<br/>
DateLabel选中时的背景色：MSS_SelectBackgroundColor<br/>
DateLabel选中后文字颜色：MSS_SelectTextColor<br/>
SubLabel文字颜色：MSS_SelectSubLabelTextColor<br/>
SubLabel选中开始文字：MSS_SelectBeginText<br/>
SubLabel选中结束文字：MSS_SelectEndText<br/>
节日颜色：MSS_HolidayTextColor<br/>
周末颜色：MSS_WeekEndTextColor<br/>
不可点击文字颜色：MSS_TouchUnableTextColor<br/>
周视图高度：MSS_WeekViewHeight<br/>
headerView线颜色：MSS_HeaderViewLineColor<br/>
headerView文字颜色：MSS_HeaderViewTextColor<br/>
headerView高度：MSS_HeaderViewHeight<br/>
弹出层文字颜色 MSS_CalendarPopViewTextColor<br/>
弹出层背景颜色 MSS_CalendarPopViewBackgroundColor<br/>

# 版本1.0
1.可设置日历显示多少个月<br/>
2.可设置日历显示方式（当前月以前，当前月以后，当前月中间）<br/>
3.可设置今天以前的日子和今天以后的日子是否可以点击<br/>

# 版本1.1
1.可设置是否显示农历及其节假日<br/>
2.直接滚动到当前选中日期<br/>
3.宏定义更多属性进行修改值<br/>

# 版本1.2
1.添加提示弹窗<br/>

#Example
```Objective-c
MSSCalendarViewController *cvc = [[MSSCalendarViewController alloc]init];
cvc.limitMonth = 12 * 15;// 显示几个月的日历
/*
MSSCalendarViewControllerLastType 只显示当前月之前
MSSCalendarViewControllerMiddleType 前后各显示一半
MSSCalendarViewControllerNextType 只显示当前月之后
*/
cvc.type = MSSCalendarViewControllerLastType;
cvc.beforeTodayCanTouch = YES;// 今天之后的日期是否可以点击
cvc.afterTodayCanTouch = NO;// 今天之前的日期是否可以点击
cvc.startDate = _startDate;// 选中开始时间
cvc.endDate = _endDate;// 选中结束时间
/*以下两个属性设为YES,计算中国农历非常耗性能（在5s加载15年以内的数据没有影响）*/
cvc.showChineseHoliday = YES;// 是否展示农历节日
cvc.showChineseCalendar = YES;// 是否展示农历
cvc.showHolidayDifferentColor = YES;// 节假日是否显示不同的颜色
cvc.showAlertView = YES;// 是否显示提示弹窗
cvc.delegate = self;
[self presentViewController:cvc animated:YES completion:nil];
```
