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
        timeAgo = [NSString stringWithFormat:@"jetzt"];
    }
    else if ((years == 0) && (months == 0) && (days == 0) && (hours == 0) && (minutes == 0))
    {
        if (seconds == 1)
            timeAgo = [NSString stringWithFormat:@"vor einer Sekunde"];
        else    
            timeAgo = [NSString stringWithFormat:@"vor %d Sekunden", seconds];
    }
    else if ((years == 0) && (months == 0) && (days == 0) && (hours == 0))
    {
        if (minutes == 1)
            timeAgo = [NSString stringWithFormat:@"vor einer Minute"];
        else    
            timeAgo = [NSString stringWithFormat:@"vor %d Minuten", minutes];
    }
    else if ((years == 0) && (months == 0) && (days == 0))
    {
        if (hours == 1)
            timeAgo = [NSString stringWithFormat:@"vor einer Stunde"];
        else    
            timeAgo = [NSString stringWithFormat:@"vor %d Stunden", hours];
    }
    else if ((years == 0) && (months == 0))
    {
        if (days == 1)
            timeAgo = [NSString stringWithFormat:@"vor einem Tag"];
        else    
            timeAgo = [NSString stringWithFormat:@"vor %d Tagen", days];
    }
    else if (years == 0)
    {
        if (months == 1)
            timeAgo = [NSString stringWithFormat:@"vor einem Monat"];
        else    
            timeAgo = [NSString stringWithFormat:@"vor %d Monaten", months];
    }
    else 
    {
        if (years == 1)
            timeAgo = [NSString stringWithFormat:@"vor einem Jahr"];
        else    
            timeAgo = [NSString stringWithFormat:@"vor %d Jahren", years];
    }
    
    return timeAgo;
}

@end
