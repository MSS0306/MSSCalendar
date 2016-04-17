//
//  MSSCalendarPopView.h
//  Test
//
//  Created by 于威 on 16/4/16.
//  Copyright © 2016年 于威. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MSSCalendarPopViewArrowPosition)
{
    MSSCalendarPopViewArrowPositionLeft = 0,
    MSSCalendarPopViewArrowPositionMiddle,
    MSSCalendarPopViewArrowPositionRight
};

@interface MSSCalendarPopView : UIView

@property (nonatomic,copy)NSString *topLabelText;
@property (nonatomic,copy)NSString *bottomLabelText;

- (instancetype)initWithSideView:(UIView *)sideView arrowPosition:(MSSCalendarPopViewArrowPosition)arrowPosition;

- (void)showWithAnimation;

@end
