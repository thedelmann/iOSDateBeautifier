//
//  DateTimeBeautifier.m
//  PalliativPortalApp
//
//  Created by thomas on 23.07.12.
//  Copyright (c) 2012 Ingenieurbüro Edelmann. All rights reserved.
//

#import "DateTimeBeautifier.h"

@implementation DateTimeBeautifier

- (NSString *) getDateTimeBeautifiedFromDate:(NSDate *)dt
{
    NSDate *now = [NSDate date];
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    NSDateComponents *components = [gregorian components:unitFlags
                                                fromDate:dt
                                                  toDate:now options:0];
    
    NSInteger seconds = [components second];
    NSInteger minutes = [components minute];
    NSInteger hours = [components hour];
    NSInteger days = [components day];
    NSInteger months = [components month];
    NSInteger years = [components year];
    
    NSString *timeAgo = nil;
    
    if ((years == 0) && (months == 0) && (days == 0) && (hours == 0) && (minutes == 0) && (seconds == 0))
    {
        timeAgo = NSLocalizedString(@"SECOND0", nil);
    }
    else if ((years == 0) && (months == 0) && (days == 0) && (hours == 0) && (minutes == 0))
    {
        if (seconds == 1)
            timeAgo = NSLocalizedString(@"SECOND1", nil);
        else    
            timeAgo = [NSString stringWithFormat:NSLocalizedString(@"SECOND2", nil), seconds];
    }
    else if ((years == 0) && (months == 0) && (days == 0) && (hours == 0))
    {
        if (minutes == 1)
            timeAgo = NSLocalizedString(@"MINUTE1", nil);
        else    
            timeAgo = [NSString stringWithFormat:NSLocalizedString(@"MINUTE2", nil), minutes];
    }
    else if ((years == 0) && (months == 0) && (days == 0))
    {
        if (hours == 1)
            timeAgo = NSLocalizedString(@"HOUR1", nil);
        else    
            timeAgo = [NSString stringWithFormat:NSLocalizedString(@"HOUR2", nil), hours];
    }
    else if ((years == 0) && (months == 0))
    {
        if (days == 1)
            timeAgo = NSLocalizedString(@"DAY1", nil);
        else    
            timeAgo = [NSString stringWithFormat:NSLocalizedString(@"DAY2", nil), days];
    }
    else if (years == 0)
    {
        if (months == 1)
            timeAgo = NSLocalizedString(@"MONTH1", nil);
        else    
            timeAgo = [NSString stringWithFormat:NSLocalizedString(@"MONTH2", nil), months];
    }
    else 
    {
        if (years == 1)
            timeAgo = NSLocalizedString(@"YEAR1", nil);
        else    
            timeAgo = [NSString stringWithFormat:NSLocalizedString(@"YEAR2", nil), years];
    }
    
    return timeAgo;
}

@end
