//
//  ViewController.m
//  MSSCalendar
//
//  Created by 于威 on 16/4/3.
//  Copyright © 2016年 于威. All rights reserved.
//

#import "ViewController.h"
#import "MSSCalendarViewController.h"
#import "MSSCalendarDefine.h"

@interface ViewController ()<MSSCalendarViewControllerDelegate>
@property (nonatomic,strong)UILabel *startLabel;
@property (nonatomic,strong)UILabel *endLabel;
@property (nonatomic,assign)NSInteger startDate;
@property (nonatomic,assign)NSInteger endDate;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createUI];
}

- (void)createUI
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake((MSS_SCREEN_WIDTH - 110) / 2, 80, 110, 50);
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont boldSystemFontOfSize:16.0f];
    btn.layer.cornerRadius = 5.0f;
    btn.layer.borderWidth = 1.0f;
    btn.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    [btn setTitle:@"打开日历" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(calendarClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    _startLabel = [[UILabel alloc]init];
    _startLabel.backgroundColor = MSS_SelectBackgroundColor;
    _startLabel.textColor = MSS_SelectTextColor;
    _startLabel.textAlignment = NSTextAlignmentCenter;
    _startLabel.font = [UIFont boldSystemFontOfSize:16.0f];
    _startLabel.frame = CGRectMake(20, CGRectGetMaxY(btn.frame) + 20, MSS_SCREEN_WIDTH - 20 * 2, 50);
    _startLabel.text = @"开始日期";
    [self.view addSubview:_startLabel];
    
    _endLabel = [[UILabel alloc]init];
    _endLabel.backgroundColor = MSS_SelectBackgroundColor;
    _endLabel.textColor = MSS_SelectTextColor;
    _endLabel.textAlignment = NSTextAlignmentCenter;
    _endLabel.font = [UIFont boldSystemFontOfSize:16.0f];
    _endLabel.frame = CGRectMake(20, CGRectGetMaxY(_startLabel.frame) + 20, MSS_SCREEN_WIDTH - 20 * 2, 50);
    _endLabel.text = @"开始日期";
    _endLabel.text = @"结束日期";
    [self.view addSubview:_endLabel];
}

- (void)calendarClick:(UIButton *)btn
{
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
}

- (void)calendarViewConfirmClickWithStartDate:(NSInteger)startDate endDate:(NSInteger)endDate
{
    _startDate = startDate;
    _endDate = endDate;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat: @"yyyy-MM-dd"];
    NSString *startDateString = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:_startDate]];
    NSString *endDateString = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:_endDate]];
    _startLabel.text = [NSString stringWithFormat:@"开始日期:%@",startDateString];
    _endLabel.text = [NSString stringWithFormat:@"结束日期:%@",endDateString];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
