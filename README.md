# MSSCalendar
A simple iOS Calendar 一款简单高性能的日历（类似去哪网）

![效果图](https://raw.githubusercontent.com/MSS0306/MSSCalendar/master/calendar.gif)

# 联系
iOS开发技术交流群:529043462

# 说明
一款高性能的日历控件<br/>
MSSCalendarDefine.h中可设置相应文字和颜色<br/>

# 版本1.0
1.可设置日历显示多少个月<br/>
2.可设置日历显示方式（当前月以前，当前月以后，当前月中间）<br/>
3.可设置今天以前的日子和今天以后的日子是否可以点击<br/>

#Example
```Objective-c
MSSCalendarViewController *cvc = [[MSSCalendarViewController alloc]init];
cvc.showMonth = 36;
cvc.type = MSSCalendarViewControllerLastType;
cvc.beforeTodayCanTouch = YES;
cvc.afterTodayCanTouch = NO;
cvc.startDate = _startDate;
cvc.endDate = _endDate;
cvc.delegate = self;
[self presentViewController:cvc animated:YES completion:nil];
```
