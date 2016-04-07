//
//  MSSCircleLabel.m
//  MSSCalendar
//
//  Created by 于威 on 16/4/4.
//  Copyright © 2016年 于威. All rights reserved.
//

#import "MSSCircleLabel.h"
#import "MSSCalendarDefine.h"

@implementation MSSCircleLabel

- (void)drawRect:(CGRect)rect
{
    if(_isSelected)
    {
        [MSS_SelectBackgroundColor setFill];
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path addArcWithCenter:CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2) radius:self.frame.size.height / 2 startAngle:0.0 endAngle:180.0 clockwise:YES];
        [path fill];
    }
    [super drawRect:rect];
}

- (void)setIsSelected:(BOOL)isSelected
{
    _isSelected = isSelected;
    [self setNeedsDisplay];
}

@end
