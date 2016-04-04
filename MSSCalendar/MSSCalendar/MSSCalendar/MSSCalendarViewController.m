//
//  MSSCalendarViewController.m
//  MSSCalendar
//
//  Created by 于威 on 16/4/3.
//  Copyright © 2016年 于威. All rights reserved.
//

#import "MSSCalendarViewController.h"
#import "MSSCalendarCollectionViewCell.h"
#import "MSSCalendarHeaderModel.h"
#import "MSSCalendarManager.h"
#import "MSSCalendarCollectionReusableView.h"
#import "MSSCalendarDefine.h"

@interface MSSCalendarViewController ()
@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation MSSCalendarViewController

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        _afterTodayCanTouch = YES;
        _beforeTodayCanTouch = YES;
        _dataArray = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initDataSource];
    [self createUI];
}

- (void)initDataSource
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        MSSCalendarManager *manager = [[MSSCalendarManager alloc]init];
        NSArray *tempDataArray = [manager getCalendarDataSoruceWithShowMonth:_showMonth type:_type];
        dispatch_async(dispatch_get_main_queue(), ^{
            [_dataArray addObjectsFromArray:tempDataArray];
            [self showCollectionView];
        });
    });
}

- (void)addWeakView
{
    UIView *weekView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, MSS_SCREEN_WIDTH, 40)];
    weekView.backgroundColor = MSS_SelectBackgroundColor;
    [self.view addSubview:weekView];
    
    NSArray *weekArray = @[@"日",@"一",@"二",@"三",@"四",@"五",@"六"];
    int i = 0;
    NSInteger width = MSS_Iphone6Scale(54);
    for(i = 0; i < 7;i++)
    {
        UILabel *weekLabel = [[UILabel alloc]initWithFrame:CGRectMake(i * width, 0, width, 40)];
        weekLabel.backgroundColor = [UIColor clearColor];
        weekLabel.text = weekArray[i];
        weekLabel.font = [UIFont boldSystemFontOfSize:16.0f];
        weekLabel.textAlignment = NSTextAlignmentCenter;
        if(i == 0 || i == 6)
        {
            weekLabel.textColor = [UIColor redColor];
        }
        else
        {
            weekLabel.textColor = MSS_SelectTextColor;
        }
        [weekView addSubview:weekLabel];
    }
}

- (void)showCollectionView
{
    [self addWeakView];
    
    [_collectionView reloadData];
    
    if(_type == MSSCalendarViewControllerLastType)
    {
        if([_dataArray count] > 0)
        {
            [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:_dataArray.count - 1] atScrollPosition:UICollectionViewScrollPositionTop animated:NO];
        }
    }
    else if(_type == MSSCalendarViewControllerMiddleType)
    {
        if([_dataArray count] > 0)
        {
            [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:(_dataArray.count - 1) / 2] atScrollPosition:UICollectionViewScrollPositionTop animated:NO];
            _collectionView.contentOffset = CGPointMake(0, _collectionView.contentOffset.y - 50);
        }
    }
}

- (void)createUI
{
    NSInteger width = MSS_Iphone6Scale(54);
    NSInteger height = MSS_Iphone6Scale(60);
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(width, height);
    flowLayout.headerReferenceSize = CGSizeMake(MSS_SCREEN_WIDTH, 50);
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64 + 40, width * 7, MSS_SCREEN_HEIGHT - 64 - 40) collectionViewLayout:flowLayout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_collectionView];
    
    [_collectionView registerClass:[MSSCalendarCollectionViewCell class] forCellWithReuseIdentifier:@"MSSCalendarCollectionViewCell"];
    [_collectionView registerClass:[MSSCalendarCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MSSCalendarCollectionReusableView"];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [_dataArray count];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    MSSCalendarHeaderModel *headerItem = _dataArray[section];
    return headerItem.calendarItemArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MSSCalendarCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MSSCalendarCollectionViewCell" forIndexPath:indexPath];
    if(cell)
    {
        MSSCalendarHeaderModel *headerItem = _dataArray[indexPath.section];
        MSSCalendarModel *calendarItem = headerItem.calendarItemArray[indexPath.row];
        
        if(calendarItem.day > 0)
        {
            cell.dateLabel.text = [NSString stringWithFormat:@"%ld",(long)calendarItem.day];
            cell.userInteractionEnabled = YES;
        }
        else
        {
            cell.dateLabel.text = @"";
            cell.userInteractionEnabled = NO;
        }
        // 开始日期，不等于零用来判断空的cell
        if(calendarItem.dateInterval == _startDate && _startDate != 0)
        {
            cell.isSelected = YES;
            cell.dateLabel.textColor = [UIColor whiteColor];
            cell.subLabel.text = MSS_SelectBegintText;
            
        }
        // 结束日期
        else if (calendarItem.dateInterval == _endDate && _endDate != 0)
        {
            cell.isSelected = YES;
            cell.dateLabel.textColor = [UIColor whiteColor];
            cell.subLabel.text = MSS_SelectEndText;
        }
        // 开始和结束之间的日期
        else if(calendarItem.dateInterval > _startDate && calendarItem.dateInterval < _endDate)
        {
            cell.isSelected = YES;
            cell.dateLabel.textColor = [UIColor whiteColor];
            cell.subLabel.text = @"";
        }
        else
        {
            cell.isSelected = NO;
            cell.subLabel.text = @"";
            if(calendarItem.holiday.length > 0)
            {
                cell.dateLabel.text = calendarItem.holiday;
                cell.dateLabel.textColor = [UIColor redColor];
            }
            else if(calendarItem.week == 0 || calendarItem.week == 6)
            {
                cell.dateLabel.textColor = [UIColor redColor];
            }
            else
            {
                cell.dateLabel.textColor = [UIColor blackColor];
            }
        }
        
        if(!_afterTodayCanTouch)
        {
            if(calendarItem.type == MSSCalendarNextType)
            {
                cell.dateLabel.textColor = MSS_UTILS_COLORRGB(150, 150, 150);
                cell.userInteractionEnabled = NO;
            }
        }
        if(!_beforeTodayCanTouch)
        {
            if(calendarItem.type == MSSCalendarLastType)
            {
                cell.dateLabel.textColor = MSS_UTILS_COLORRGB(150, 150, 150);
                cell.userInteractionEnabled = NO;
            }
        }
    }
    return cell;
}

// 添加header
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        MSSCalendarCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"MSSCalendarCollectionReusableView" forIndexPath:indexPath];
        MSSCalendarHeaderModel *headerItem = _dataArray[indexPath.section];
        headerView.headerLabel.text = headerItem.headerText;
        return headerView;
    }
    return nil;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    MSSCalendarHeaderModel *headerItem = _dataArray[indexPath.section];
    MSSCalendarModel *calendaItem = headerItem.calendarItemArray[indexPath.row];
    if(_startDate == calendaItem.dateInterval)
    {
        return;
    }
    // 当开始日期为空时
    if(_startDate == 0)
    {
        _startDate = calendaItem.dateInterval;
    }
    // 当开始日期和结束日期同时存在时(点击为重新选时间段)
    else if(_startDate > 0 && _endDate > 0)
    {
        _startDate = calendaItem.dateInterval;
        _endDate = 0;
    }
    else
    {
        // 判断第二个选择日期是否比现在开始日期大
        if(_startDate < calendaItem.dateInterval)
        {
            _endDate = calendaItem.dateInterval;
            if([_delegate respondsToSelector:@selector(calendarViewConfirmClickWithStartDate:endDate:)])
            {
                [_delegate calendarViewConfirmClickWithStartDate:_startDate endDate:_endDate];
            }
            [self dismissViewControllerAnimated:YES completion:nil];
        }
        else
        {
            _startDate = calendaItem.dateInterval;
        }
    }
    [_collectionView reloadData];
}

@end
