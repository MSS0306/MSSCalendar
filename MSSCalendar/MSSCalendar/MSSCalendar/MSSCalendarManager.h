//
//  MSSCalendarManager.h
//  MSSCalendar
//
//  Created by 于威 on 16/4/3.
//  Copyright © 2016年 于威. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSSCalendarViewController.h"
@interface MSSCalendarManager : NSObject

// 数据源
- (NSArray *)getCalendarDataSoruceWithShowMonth:(NSInteger)showMonth type:(MSSCalendarViewControllerType)type;

@end
