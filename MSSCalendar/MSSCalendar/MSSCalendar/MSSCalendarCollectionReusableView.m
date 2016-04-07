//
//  MSSCalendarCollectionReusableView.m
//  MSSCalendar
//
//  Created by 于威 on 16/4/3.
//  Copyright © 2016年 于威. All rights reserved.
//

#import "MSSCalendarCollectionReusableView.h"
#import "MSSCalendarDefine.h"

@implementation MSSCalendarCollectionReusableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self createReusableView];
    }
    return self;
}

- (void)createReusableView
{
    UIView *headerView = [[UIView alloc]init];
    headerView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [self addSubview:headerView];

    _headerLabel = [[UILabel alloc]init];
    _headerLabel.frame = CGRectMake(10, 0, self.frame.size.width - 10, self.frame.size.height);
    _headerLabel.textAlignment = NSTextAlignmentCenter;
    _headerLabel.backgroundColor = [UIColor clearColor];
    _headerLabel.textColor = MSS_HeaderViewTextColor;
    [headerView addSubview:_headerLabel];
    
    
    UIView *topLineView = [[UIView alloc]init];
    topLineView.frame = CGRectMake(0, 0, headerView.frame.size.width, MSS_ONE_PIXEL);
    topLineView.backgroundColor = MSS_HeaderViewLineColor;
    [headerView addSubview:topLineView];
    
    UIView *bottomLineView = [[UIView alloc]init];
    bottomLineView.frame = CGRectMake(0, headerView.frame.size.height - MSS_ONE_PIXEL, headerView.frame.size.width, MSS_ONE_PIXEL);
    bottomLineView.backgroundColor = MSS_HeaderViewLineColor;
    [headerView addSubview:bottomLineView];
}

@end
